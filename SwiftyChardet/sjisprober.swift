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

class SJISProber: MultiByteCharSetProber {

    let contextAnalyzer: JapaneseContextAnalysis
    var _codingSM = CodingStateMachine(SJIS_SM_MODEL)
    var _distributionAnalyzer = SJISDistributionAnalysis()

    init() {
        self.contextAnalyzer = SJISContextAnalysis()
        super.init()
        self.reset()
    }

    override func reset() {
        super.reset()
        self.contextAnalyzer.reset()
    }

    override var codingSM: CodingStateMachine {
        return self._codingSM
    }

    override var distributionAnalyzer: CharDistributionAnalysis {
        return self._distributionAnalyzer
    }

    override var charsetName: String {
        return self.contextAnalyzer.charsetName
    }

    override var confidence: Double {
        let context_conf = self.contextAnalyzer.confidence
        let distrib_conf = self.distributionAnalyzer.confidence
        return max(context_conf, distrib_conf)
    }

    override func feed(byte_str: [UInt8]) -> ProbingState {
        outer: for (i, c) in byte_str.enumerate() {
            let coding_state = self.codingSM.next_state(c)
            switch (coding_state) {
            case .error:
                self.state = .not_me
                break outer
            case .its_me:
                self.state = .found_it
                break outer
            case .start:
                let char_len = self.codingSM.currentCharLen
                if i == 0 {
                    self._last_char[1] = byte_str[0]
                    self.contextAnalyzer.feed([UInt8](self._last_char[(2 - char_len) ..< len(self._last_char)]), char_len)
                    self.distributionAnalyzer.feed(self._last_char, char_len)
                } else {
                    self.contextAnalyzer.feed([UInt8](byte_str[(i + 1 - char_len) ..< min(i + 3 - char_len, len(byte_str))]), char_len)
                    self.distributionAnalyzer.feed([UInt8](byte_str[(i - 1) ..< (i + 1)]), char_len)
                }
            default:
                continue
            }
        }

        self._last_char[0] = byte_str[len(byte_str) - 1]

        if self.state == .detecting {
            if (self.contextAnalyzer.gotEnoughData &&
                    (self.confidence > self.SHORTCUT_THRESHOLD)) {
                self.state = .found_it
            }
        }
        return self.state
    }
}
