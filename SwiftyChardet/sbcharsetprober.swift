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
typealias SingleByteCharSetModel = (
    char_to_order_map:[Int],
    precedence_matrix:[Int],
    typical_positive_ratio:Double,
    keep_english_letter:Bool,
    charset_name:String)


class SingleByteCharSetProber: CharSetProber {
    let SAMPLE_SIZE = 64
    let SB_ENOUGH_REL_THRESHOLD = 1024
    let POSITIVE_SHORTCUT_THRESHOLD = 0.95
    let NEGATIVE_SHORTCUT_THRESHOLD = 0.05
    let SYMBOL_CAT_ORDER = 250
    let NUMBER_OF_SEQ_CAT = 4
    //POSITIVE_CAT = NUMBER_OF_SEQ_CAT - 1
    let POSITIVE_CAT = 4 - 1

    var _model: SingleByteCharSetModel
    var _reversed: Bool
    var _name_prober: CharSetProber?

    var _last_order: Int
    var _seq_counters: [Int]
    var _total_seqs: Int
    var _total_char: Int
    var _freq_char: Int

    init(_ model: SingleByteCharSetModel, _ reversed: Bool = false, _ name_prober: CharSetProber? = nil) {
        self._model = model
        // TRUE if we need to reverse every pair in the model lookup
        self._reversed = reversed
        // Optional auxiliary prober for name decision
        self._name_prober = name_prober

        self._last_order = 255
        self._seq_counters = [Int](count: self.NUMBER_OF_SEQ_CAT, repeatedValue: 0)
        self._total_seqs = 0
        self._total_char = 0
        self._freq_char = 0
        super.init()
        self.reset()
    }

    override func reset() {
        super.reset()
        // char order of last character
        self._last_order = 255
        self._seq_counters = [Int](count: self.NUMBER_OF_SEQ_CAT, repeatedValue: 0)
        self._total_seqs = 0
        self._total_char = 0
        // characters that fall in our sampling range
        self._freq_char = 0
    }

    override var charsetName: String {
        guard let name_prober = self._name_prober else {
            return self._model.charset_name
        }
        return name_prober.charsetName
    }

    override func feed(str: [UInt8]) -> ProbingState {
        var byte_str = str
        if !self._model.keep_english_letter {
            byte_str = CharSetProber.filterInternationalWords(byte_str)
        }
        let num_bytes = len(byte_str)
        if num_bytes == 0 {
            return self.state
        }
        for c in byte_str {
            let order = self._model.char_to_order_map[c]
            if order < self.SYMBOL_CAT_ORDER {
                self._total_char += 1
            }
            if order < self.SAMPLE_SIZE {
                self._freq_char += 1
                if self._last_order < self.SAMPLE_SIZE {
                    var model: Int
                    self._total_seqs += 1
                    if !self._reversed {
                        let i = (self._last_order * self.SAMPLE_SIZE) + order
                        model = self._model.precedence_matrix[i]
                    } else {
                        // reverse the order of the letters in the lookup
                        let i = (order * self.SAMPLE_SIZE) + self._last_order
                        model = self._model.precedence_matrix[i]
                    }
                    self._seq_counters[model] += 1
                }
            }
            self._last_order = order
        }
        if self.state == .detecting {
            if self._total_seqs > self.SB_ENOUGH_REL_THRESHOLD {
                let cf = self.confidence
                if cf > self.POSITIVE_SHORTCUT_THRESHOLD {
                    self.state = .found_it
                } else if cf < self.NEGATIVE_SHORTCUT_THRESHOLD {
                    self.state = .not_me
                }
            }
        }
        return self.state
    }

    override var confidence: Double {
        var r: Double = 0.01
        if self._total_seqs > 0 {
            r = ((1.0 * Double(self._seq_counters[self.POSITIVE_CAT])) / Double(self._total_seqs)
                    / self._model.typical_positive_ratio)
            r = r * Double(self._freq_char) / Double(self._total_char)
            if r >= 1.0 {
                r = 0.99
            }
        }
        return r
    }
}
