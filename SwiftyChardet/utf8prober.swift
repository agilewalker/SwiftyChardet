/*
######################## BEGIN LICENSE BLOCK ########################
# The Original Code is mozilla.org code.
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

class UTF8Prober: CharSetProber {
    let ONE_CHAR_PROB = 0.5
    let codingSM: CodingStateMachine
    var _num_mb_chars: Int
    init() {
        self.codingSM = CodingStateMachine(UTF8_SM_MODEL)
        self._num_mb_chars = 0
        super.init()
        self.reset()
    }

    override func reset() {
        super.reset()
        self.codingSM.reset()
        self._num_mb_chars = 0
    }

    override var charsetName: String {
        return "UTF-8"
    }

    override func feed(_ str: Data) -> ProbingState {
        outer:
        for c in str {
            let coding_state = self.codingSM.next_state(c)
            switch (coding_state) {
            case MachineState.error:
                self.state = ProbingState.not_me
                break outer
            case MachineState.its_me:
                self.state = ProbingState.found_it
                break outer
            case MachineState.start:
                if self.codingSM.currentCharLen >= 2 {
                    self._num_mb_chars += 1
                }
            default:
                continue
            }
        }
        if self.state == ProbingState.detecting {
            if self.confidence > self.SHORTCUT_THRESHOLD {
                self.state = ProbingState.found_it
            }
        }
        return self.state
    }

    override var confidence: Double {
        var unlike: Double = 0.99
        if self._num_mb_chars < 6 {
            unlike *= pow(self.ONE_CHAR_PROB, Double(self._num_mb_chars))
            return 1.0 - unlike
        } else {
            return unlike
        }
    }
}
