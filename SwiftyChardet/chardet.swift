//
//  chardet.swift
//  SwiftyChardet
//
//  Created by wu on 1/7/16.
//  Copyright © 2016 Wu Hui Yuan. All rights reserved.
//

func translateEncoding(_ encoding: String) -> [UInt] {
    var encoding_translation: [String: [UInt]] = [
        "UTF-8": [String.Encoding.utf8.rawValue],
        "UTF-8-SIG": [String.Encoding.utf8.rawValue],
        "UTF-16": [String.Encoding.utf16.rawValue],
        "UTF-32": [String.Encoding.utf32.rawValue],
        "windows-1252": [String.Encoding.windowsCP1252.rawValue],
        "ascii": [CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingASCII)],
    ]
    let miscEncodings: [String: [CFStringEncodings]] = [
        "Big5": [.big5, .big5_HKSCS_1999, .big5_E],
        "GB2312": [.GB_2312_80, .GB_18030_2000],
        "EUC-TW": [.EUC_TW],
        "HZ-GB-2312": [.HZ_GB_2312],
        "ISO-2022-CN": [.ISO_2022_CN, .ISO_2022_CN_EXT],
        "EUC-JP": [.EUC_JP],
        "SHIFT_JIS": [.shiftJIS, .shiftJIS_X0213, .shiftJIS_X0213_MenKuTen],
        "CP932": [.dosJapanese],
        "ISO-2022-JP": [.ISO_2022_JP, .ISO_2022_JP_1, .ISO_2022_JP_2, .ISO_2022_JP_3],
        "CP949": [.dosKorean],
        "EUC-KR": [.EUC_KR],
        "ISO-2022-KR": [.ISO_2022_KR],
        "KOI8-R": [.KOI8_R],
        "MacCyrillic": [.macCyrillic],
        "IBM855": [.dosCyrillic],
        "IBM866": [.dosRussian],
        "ISO-8859-5": [.isoLatinCyrillic],
        "windows-1251": [.windowsCyrillic],
        "ISO-8859-2": [.isoLatin2],
        "windows-1250": [.windowsLatin2],
        "ISO-8859-7": [.isoLatinGreek],
        "windows-1253": [.windowsGreek],
        "ISO-8859-8": [.isoLatinHebrew],
        "windows-1255": [.windowsHebrew],
        "ISO-8859-9": [.isoLatin5],
        "TIS-620": [.isoLatinThai],
    ]
    for (k, v) in miscEncodings {
        encoding_translation[k] = v.map{CFStringConvertEncodingToNSStringEncoding(CFStringEncoding($0.rawValue))}
    }
    return encoding_translation[encoding]!
}
public class CharsetDetectionFailed: ErrorProtocol {}
public class SwiftyChardet {
    public static func detect(_ data: Data) -> (String, Double) {
        let u = UniversalDetector()
        u.feed(data)
        u.close()
        return u.result
    }
    
    public static func decode(_ data:Data) throws -> String {
        let guessedEncoding = SwiftyChardet.detect(data).0
        var content: String? = nil
        for encoding in translateEncoding(guessedEncoding) {
            content = String(data: data, encoding: String.Encoding(rawValue: encoding))
            if content != nil {
                break
            }
        }
        guard let _content = content else {
            throw CharsetDetectionFailed()
        }
        return _content
    }
}


