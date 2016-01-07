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
let FREQ_CAT_NUM = 4

let UDF: UInt8 = 0  // undefined
let OTH: UInt8 = 1  // other
let ASC: UInt8 = 2  // ascii capital letter
let ASS: UInt8 = 3  // ascii small letter
let ACV: UInt8 = 4  // accent capital vowel
let ACO: UInt8 = 5  // accent capital other
let ASV: UInt8 = 6  // accent small vowel
let ASO: UInt8 = 7  // accent small other
let CLASS_NUM: UInt8 = 8  // total classes

let Latin1CharToClass: [UInt8] = [
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 00 - 07
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 08 - 0F
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 10 - 17
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 18 - 1F
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 20 - 27
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 28 - 2F
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 30 - 37
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 38 - 3F
        OTH, ASC, ASC, ASC, ASC, ASC, ASC, ASC, // 40 - 47
        ASC, ASC, ASC, ASC, ASC, ASC, ASC, ASC, // 48 - 4F
        ASC, ASC, ASC, ASC, ASC, ASC, ASC, ASC, // 50 - 57
        ASC, ASC, ASC, OTH, OTH, OTH, OTH, OTH, // 58 - 5F
        OTH, ASS, ASS, ASS, ASS, ASS, ASS, ASS, // 60 - 67
        ASS, ASS, ASS, ASS, ASS, ASS, ASS, ASS, // 68 - 6F
        ASS, ASS, ASS, ASS, ASS, ASS, ASS, ASS, // 70 - 77
        ASS, ASS, ASS, OTH, OTH, OTH, OTH, OTH, // 78 - 7F
        OTH, UDF, OTH, ASO, OTH, OTH, OTH, OTH, // 80 - 87
        OTH, OTH, ACO, OTH, ACO, UDF, ACO, UDF, // 88 - 8F
        UDF, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // 90 - 97
        OTH, OTH, ASO, OTH, ASO, UDF, ASO, ACO, // 98 - 9F
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // A0 - A7
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // A8 - AF
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // B0 - B7
        OTH, OTH, OTH, OTH, OTH, OTH, OTH, OTH, // B8 - BF
        ACV, ACV, ACV, ACV, ACV, ACV, ACO, ACO, // C0 - C7
        ACV, ACV, ACV, ACV, ACV, ACV, ACV, ACV, // C8 - CF
        ACO, ACO, ACV, ACV, ACV, ACV, ACV, OTH, // D0 - D7
        ACV, ACV, ACV, ACV, ACV, ACO, ACO, ACO, // D8 - DF
        ASV, ASV, ASV, ASV, ASV, ASV, ASO, ASO, // E0 - E7
        ASV, ASV, ASV, ASV, ASV, ASV, ASV, ASV, // E8 - EF
        ASO, ASO, ASV, ASV, ASV, ASV, ASV, OTH, // F0 - F7
        ASV, ASV, ASV, ASV, ASV, ASO, ASO, ASO, // F8 - FF
]

// 0 : illegal
// 1 : very unlikely
// 2 : normal
// 3 : very likely
let Latin1ClassModel: [UInt8] = [
// UDF OTH ASC ASS ACV ACO ASV ASO
        0, 0, 0, 0, 0, 0, 0, 0, // UDF
        0, 3, 3, 3, 3, 3, 3, 3, // OTH
        0, 3, 3, 3, 3, 3, 3, 3, // ASC
        0, 3, 3, 3, 1, 1, 3, 3, // ASS
        0, 3, 3, 3, 1, 2, 1, 2, // ACV
        0, 3, 3, 3, 3, 3, 3, 3, // ACO
        0, 3, 1, 3, 1, 1, 1, 3, // ASV
        0, 3, 1, 3, 1, 1, 3, 3, // ASO
]


class Latin1Prober: CharSetProber {
    var _mLastCharClass: UInt8 = OTH
    var _mFreqCounter: [Int] = []

    init() {
        super.init()
        self.reset()
    }

    override func reset() {
        self._mLastCharClass = OTH
        self._mFreqCounter = [Int](count: FREQ_CAT_NUM, repeatedValue: 0)
    }

    override var charsetName: String {
        return "windows-1252"
    }

    override func feed(str: [UInt8]) -> ProbingState {
        let _str = CharSetProber.filterWithEnglishLetters(str)
        for c in _str {
            let charClass = Latin1CharToClass[c]
            let freq = Latin1ClassModel[(self._mLastCharClass * CLASS_NUM)
                    + charClass]
            if freq == 0 {
                self.state = .not_me
                break
            }
            self._mFreqCounter[Int(freq)] += 1
            self._mLastCharClass = charClass
        }
        return self.state
    }

    override var confidence: Double {
        if self.state == .not_me {
            return 0.01
        }
        var _confidence: Double
        let total: Double = Double(self._mFreqCounter.sum())

        if total < 0.01 {
            _confidence = 0.0
        } else {
            _confidence = (Double(self._mFreqCounter[3] - self._mFreqCounter[1] * 20)
                    / total)
        }
        if _confidence < 0.0 {
            _confidence = 0.0
        }
        // lower the confidence of latin1 so that other more accurate
        // detector can take priority.
        _confidence = _confidence * 0.73
        return _confidence
    }
}