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
///Module containing the UniversalDetector detector class, which is the primary
///class a user of ``chardet`` should use.
///
///:author: Mark Pilgrim (initial port to Python)
///:author: Shy Shalom (original C code)
///:author: Dan Blanchard (major refactoring for 3.0)
///:author: Ian Cordasco

/// The ``UniversalDetector`` class underlies the ``chardet.detect`` function
/// and coordinates all of the different charset probers.
///
/// To get a ``tuple`` containing an encoding and its confidence, you can simply
/// run:
///
///     let u = UniversalDetector()
///     u.feed(some_bytes)
///     u.close()
///     detected = u.result
class UniversalDetector {

    let MINIMUM_THRESHOLD = 0.20
    var _esc_charset_prober: CharSetProber!
    var _charset_probers: [CharSetProber]
    var result: (encoding:String, confidence:Double)
    var done: Bool
    var _got_data: Bool
    var _input_state: InputState
    var _last_char: UInt8
    var lang_filter: LanguageFilter

    init(lang_filter: LanguageFilter = .all) {
        self._esc_charset_prober = nil
        self._charset_probers = []
        self.result = (encoding: "", confidence: 0.0)
        self.done = false
        self._got_data = false
        self._input_state = .pure_ascii
        self._last_char = 0x20
        self.lang_filter = lang_filter
        self.reset()
    }

    func detectedHighByte(byte_str: [UInt8]) -> Bool {
        for byte in byte_str {
            if byte.isinternational() {
                return true
            }
        }
        return false
    }

    func detectedEscapedSequence(byte_str: [UInt8]) -> Bool {
        for (c, byte) in byte_str.enumerate() {
            if byte == 0x1B || (byte == 0x7B && c > 0 && byte_str[c - 1] == 0x7E) {
                return true
            }
        }
        return false
    }

/// Reset the UniversalDetector and all of its probers back to their
/// initial states.  This is called by ``init``, so you only need to
/// call this directly in between analyses of different documents.
    func reset() {
        self.result = (encoding: "", confidence: 0.0)
        self.done = false
        self._got_data = false
        self._input_state = .pure_ascii
        self._last_char = 0x20
        if let esc_charset_prober = self._esc_charset_prober {
            esc_charset_prober.reset()
        }
        for prober in self._charset_probers {
            prober.reset()
        }
    }
    
/// Takes a chunk of a document and feeds it through all of the relevant
/// charset probers.
///
/// After calling ``feed``, you can check the value of the ``done``
/// attribute to see if you need to continue feeding the
/// ``UniversalDetector`` more data, or if it has made a prediction
/// (in the ``result`` attribute).
///
/// - note:
///     You should always call ``close`` when you're done feeding in your
///     document if ``done`` is not already ``true``.
    func feed(byte_str: [UInt8]) {
        if self.done {
            return
        }
        if len(byte_str) == 0 {
            return
        }
        // First check for known BOMs, since these are guaranteed to be correct
        if !self._got_data {
            // If the data starts with BOM, we know it is UTF
            if byte_str.startsWith([0xEF, 0xBB, 0xBF]) {
                // EF BB BF  UTF-8 with BOM
                self.result = (encoding: "UTF-8-SIG", confidence: 1.0)
            } else if byte_str.startsWith([0xFF, 0xFE, 0x00, 0x00]) || byte_str.startsWith([0x00, 0x00, 0xFE, 0xFF]) {
                // FF FE 00 00  UTF-32, little-endian BOM
                // 00 00 FE FF  UTF-32, big-endian BOM
                self.result = (encoding: "UTF-32", confidence: 1.0)
            } else if byte_str.startsWith([0xFF, 0xFE]) || byte_str.startsWith([0xFE, 0xFF]) {
                // FF FE  UTF-16, little endian BOM
                // FE FF  UTF-16, big endian BOM
                self.result = (encoding: "UTF-16", confidence: 1.0)
            }
            self._got_data = true
            if self.result.encoding {
                self.done = true
                return
            }
        }

        // If none of those matched and we've only see ASCII so far, check
        // for high bytes and escape sequences
        if self._input_state == .pure_ascii {
            if self.detectedHighByte(byte_str) {
                self._input_state = .high_byte
            } else {
                var new_byte_str: [UInt8] = [self._last_char]
                new_byte_str.appendContentsOf(byte_str)
                if self.detectedEscapedSequence(new_byte_str) {
                    self._input_state = .esc_ascii
                }
            }
        }
        self._last_char = byte_str[len(byte_str) - 1]

        // If we've seen escape sequences, use the EscCharSetProber, which
        // uses a simple state machine to check for known escape sequences in
        // HZ and ISO-2022 encodings, since those are the only encodings that
        // use such sequences.
        if self._input_state == .esc_ascii {
            if self._esc_charset_prober == nil {
                self._esc_charset_prober = EscCharSetProber(langFilter: self.lang_filter)
            }
            if self._esc_charset_prober.feed(byte_str) == .found_it {
                self.result = (encoding: self._esc_charset_prober.charsetName, confidence: self._esc_charset_prober.confidence)
                self.done = true
            }
        } else if self._input_state == .high_byte {
            // If we've seen high bytes (i.e., those with values greater than 127),
            // we need to do more complicated checks using all our multi-byte and
            // single-byte probers that are left.  The single-byte probers
            // use character bigram distributions to determine the encoding, whereas
            // the multi-byte probers use a combination of character unigram and
            // bigram distributions.
            if !self._charset_probers {
                self._charset_probers = [MBCSGroupProber(langFilter: self.lang_filter)]
                // If we"re checking non-CJK encodings, use single-byte prober
                if self.lang_filter.contains(.non_cjk) {
                    self._charset_probers.append(SBCSGroupProber())
                }
                self._charset_probers.append(Latin1Prober())
            }
            for prober in self._charset_probers {
                if prober.feed(byte_str) == .found_it {
                    self.result = (encoding: prober.charsetName, confidence: prober.confidence)
                    self.done = true
                    break
                }
            }
        }
    }
//    Stop analyzing the current document and come up with a final
//    prediction.
//    
//    :returns:  The ``result`` attribute if a prediction was made.
    func close() -> (encoding:String, confidence:Double) {

        
        if self.done {
            return self.result
        }
        if !self._got_data {
            return self.result
        }
        self.done = true

        if [.pure_ascii, .esc_ascii].contains(self._input_state) {
            self.result = (encoding: "ascii", confidence: 1.0)
            return self.result
        }
        if self._input_state == .high_byte {
            var max_prober_confidence: Double = 0.0
            var max_prober: CharSetProber? = nil
            for prober in self._charset_probers {
                let proberConfidence = prober.confidence
                if proberConfidence > max_prober_confidence {
                    max_prober_confidence = proberConfidence
                    max_prober = prober
                }
            }
            if let _max_prober = max_prober where max_prober_confidence > self.MINIMUM_THRESHOLD {
                self.result = (encoding: _max_prober.charsetName,
                        confidence: _max_prober.confidence)
                return self.result
            }
        }
        let group_prober = self._charset_probers[0] as! CharSetGroupProber
        for prober in group_prober.probers {
            print("\(prober.charsetName) confidence = \(prober.confidence)")
        }
        return self.result
    }
}