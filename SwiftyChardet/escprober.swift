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

class EscCharSetProber: CharSetProber {
    /*
    This CharSetProber uses a "code scheme" approach for detecting encodings,
    whereby easily recognizable escape or shift sequences are relied on to
    identify these encodings.
    */
    var codingSM: [CodingStateMachine]
    var active_sm_count: Int
    var _detected_charset: String

    override init(langFilter: LanguageFilter = []) {
        self.codingSM = []
        self.active_sm_count = 0
        self._detected_charset = ""
        super.init(langFilter: langFilter)
        if self.lang_filter.contains(.chinese_simplified) {
            self.codingSM.append(CodingStateMachine(HZ_SM_MODEL))
            self.codingSM.append(CodingStateMachine(ISO2022CN_SM_MODEL))
        }
        if self.lang_filter.contains(.japanese) {
            self.codingSM.append(CodingStateMachine(ISO2022JP_SM_MODEL))
        }
        if self.lang_filter.contains(.korean) {
            self.codingSM.append(CodingStateMachine(ISO2022KR_SM_MODEL))
        }
        self.reset()
    }

    override func reset() {
        super.reset()
        for codingSM in self.codingSM {
            codingSM.active = true
            codingSM.reset()
        }
        self.active_sm_count = len(self.codingSM)
        self._detected_charset = ""
    }

    override var charsetName: String {
        return self._detected_charset
    }

    override var confidence: Double {
        if self._detected_charset {
            return 0.99
        } else {
            return 0.00
        }
    }

    override func feed(_ str: Data) -> ProbingState {
        for c in str {
            for codingSM in self.codingSM {
                if !codingSM.active {
                    continue
                }
                let coding_state = codingSM.next_state(c)
                if coding_state == MachineState.error {
                    codingSM.active = false
                    self.active_sm_count -= 1
                    if self.active_sm_count <= 0 {
                        self.state = ProbingState.not_me
                        return self.state
                    }
                } else if coding_state == MachineState.its_me {
                    self.state = ProbingState.found_it
                    self._detected_charset = codingSM.codingStateMachine
                    return self.state
                }
            }
        }
        return self.state
    }
}
