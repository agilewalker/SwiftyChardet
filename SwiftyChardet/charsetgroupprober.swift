/*
######################## BEGIN LICENSE BLOCK ########################
# The Original Code is Mozilla Communicator client code.
#
# The Initial Developer of the Original Code is
# Netscape Communications Corporation.
# Portions created by the Initial Developer are Copyright (C) 1998
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Wu Hui Yuan - port to Swift
#   Mark Pilgrim - port to Python
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301  USA
######################### END LICENSE BLOCK #########################
*/

class CharSetGroupProber: CharSetProber {
    var _active_num: Int
    var probers: [CharSetProber]
    var _best_guess_prober: CharSetProber!

    override init(langFilter: LanguageFilter = []) {
        self._active_num = 0
        self.probers = []
        self._best_guess_prober = nil
        super.init(langFilter: langFilter)
    }

    override func reset() {
        super.reset()
        self._active_num = 0
        for prober in self.probers {
            prober.reset()
            prober.active = true
            self._active_num += 1
        }
        self._best_guess_prober = nil
    }

    override var charsetName: String {
        if self._best_guess_prober == nil {
            _ = self.confidence
            if self._best_guess_prober == nil {
                return ""
            }
        }
        return self._best_guess_prober.charsetName
    }

    override func feed(str: [UInt8]) -> ProbingState {
        for prober in self.probers {
            if !prober.active {
                continue
            }
            let state = prober.feed(str)
            switch (state) {
            case .detecting:
                continue
            case .found_it:
                self._best_guess_prober = prober
                return self.state
            case .not_me:
                prober.active = false
                self._active_num -= 1
                if self._active_num <= 0 {
                    self.state = .not_me
                    return self.state
                }
            }
        }
        return self.state
    }

    override var confidence: Double {
        let _state = self.state
        if _state == ProbingState.found_it {
            return 0.99
        } else if state == ProbingState.not_me {
            return 0.01
        }
        var best_conf = 0.0
        self._best_guess_prober = nil
        for prober in self.probers {
            if !prober.active {
                continue
            }
            let conf = prober.confidence
            if best_conf < conf {
                best_conf = conf
                self._best_guess_prober = prober
            }
        }
        if self._best_guess_prober == nil {
            return 0.0
        }
        return best_conf
    }
}
