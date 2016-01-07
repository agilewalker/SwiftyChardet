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

class CharSetProber {
    let SHORTCUT_THRESHOLD = 0.95

    var charsetName: String {
        get {
            return ""
        }
    }

    var state: ProbingState = .detecting

    var confidence: Double {
        get {
            return 0.0
        }
    }

    var active: Bool = false

    let lang_filter: LanguageFilter

    init(langFilter: LanguageFilter = []) {
        self.lang_filter = langFilter
    }

    func feed(str: [UInt8]) -> ProbingState {
        fatalError("feed() not implemented")
    }

    func reset() {
        self.state = .detecting
    }

    static func filterHighByteOnly(aBuf: [UInt8]) -> [UInt8] {
        return aBuf.map {
            return $0.isinternational() ? $0 : 0x20
        }
    }
    
/// We define three types of bytes:
/// - alphabet: english alphabets [a-zA-Z]
/// - international: international characters [\x80-\xFF]
/// - marker: everything else [^a-zA-Z\x80-\xFF]
///
/// The input buffer can be thought to contain a series of words delimited
/// by markers. This function works to filter all words that contain at
/// least one international character. All contiguous sequences of markers
/// are replaced by a single space ascii character.
///
/// This filter applies to all scripts which do not use English characters.
    static func filterInternationalWords(buf: [UInt8]) -> [UInt8] {


        var filtered: [UInt8] = []

        // This regex expression filters out only words that have at-least one
        // international character. The word may include one marker character at
        // the end.
        var start = 0
        var end = 0
        var hasHighByte = false
        var prev: UInt8 = 0x20
        for (i, c) in buf.enumerate() {
            if c.isalpha() || c.isinternational() {
                if prev.ismarker() {
                    start = i
                }
                if c.isinternational() {
                    hasHighByte = true
                }
            }
            // If the last character in the word is a marker, replace it with a
            // space as markers shouldn't affect our analysis (they are used
            // similarly across all languages and may thus have similar
            // frequencies).
            if c.ismarker() && (prev.isalpha() || prev.isinternational()) {
                end = i
                if (end > start) && hasHighByte {
                    filtered.appendContentsOf(buf[start ..< end])
                    filtered.append(0x20)
                }
                start = 0
                end = 0
                hasHighByte = false
            }
            prev = c
        }

        return filtered
    }
    
/// Returns a copy of ``buf`` that retains only the sequences of English
/// alphabet and high byte characters that are not between <> characters.
/// Also retains English alphabet and high byte characters immediately
/// before occurrences of >.
///
/// This filter can be applied to all scripts which contain both English
/// characters and extended ASCII characters, but is currently only used by
/// ``Latin1Prober``.
    static func filterWithEnglishLetters(buf: [UInt8]) -> [UInt8] {
        var filtered: [UInt8] = []
        var in_tag: Bool = false
        var prev: Int = 0

        for (curr, c) in buf.enumerate() {
            // Check if we're coming out of or entering an HTML tag
            if c == 0x3e {
                in_tag = false
            } else if c == 0x3c {
                in_tag = true
            }

            // If current character is not extended-ASCII and not alphabetic...
            if c < 0x80 && !c.isalpha() {
                // ...and we're not in a tag
                if curr > prev && !in_tag {
                    // Keep everything after last non-extended-ASCII, non-alphabetic character
                    filtered.appendContentsOf(buf[prev ..< curr])
                    // Output a space to delimit stretch we kept
                    filtered.append(0x20)
                }
                prev = curr + 1
            }
        }
        // If we're not in a tag...
        if !in_tag {
            // Keep everything after last non-extended-ASCII, non-alphabetic character
            filtered.appendContentsOf(buf[prev ..< len(buf)])
        }
        return filtered
    }
}