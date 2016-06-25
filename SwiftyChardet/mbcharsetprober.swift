/*
######################## BEGIN LICENSE BLOCK ########################
# The Original Code is Mozilla Universal charset detector code.
#
# The Initial Developer of the Original Code is
# Netscape Communications Corporation.
# Portions created by the Initial Developer are Copyright (C) 2001
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Wu Hui Yuan - port to Swift
#   Mark Pilgrim - port to Python
#   Shy Shalom - original C code
#   Proofpoint, Inc.
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

class MultiByteCharSetProber: CharSetProber {
    /*
    MultiByteCharSetProber
    */
    var _last_char: Data

    var codingSM: CodingStateMachine {
        fatalError("var codingSM getter not implemented")
    }

    var distributionAnalyzer: CharDistributionAnalysis {
        fatalError("var distributionAnalyzer getter not implemented")
    }

    override init(langFilter: LanguageFilter = []) {
        self._last_char = Data(bytes: [0, 0])
        super.init(langFilter: langFilter)
    }

    override func reset() {
        super.reset()
        self.codingSM.reset()
        self.distributionAnalyzer.reset()
        self._last_char = Data(bytes: [0, 0])
    }

    override func feed(_ byte_str: Data) -> ProbingState {
        outer:
        for (i, c) in byte_str.enumerated() {
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
                    self.distributionAnalyzer.feed(self._last_char, char_len)
                } else {
                    self.distributionAnalyzer.feed(byte_str[i - 1 ..< i + 1], char_len)
                }
            default:
                continue
            }
        }
        self._last_char[0] = byte_str.last!

        if self.state == .detecting {
            if (self.distributionAnalyzer.gotEnoughData && (self.confidence > self.SHORTCUT_THRESHOLD)) {
                self.state = .found_it
            }
        }

        return self.state
    }

    override var confidence: Double {
        return self.distributionAnalyzer.confidence
    }
}
