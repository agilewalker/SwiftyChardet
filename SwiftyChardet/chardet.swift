//
//  chardet.swift
//  SwiftyChardet
//
//  Created by wu on 1/7/16.
//  Copyright © 2016 Wu Hui Yuan. All rights reserved.
//

extension NSData {
    func toBytes() -> [UInt8] {
        return Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>(self.bytes), count: self.length))
    }
}

func translateEncoding(encoding: String) -> [UInt] {
    var encoding_translation = [
        "UTF-8": [NSUTF8StringEncoding],
        "UTF-8-SIG": [NSUTF8StringEncoding],
        "UTF-16": [NSUTF16StringEncoding],
        "UTF-32": [NSUTF32StringEncoding],
        "windows-1252": [NSWindowsCP1252StringEncoding],
        "ascii": [CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingASCII)],
    ]
    let miscEncodings: [String: [CFStringEncodings]] = [
        "Big5": [.Big5, .Big5_HKSCS_1999, .Big5_E],
        "GB2312": [.GB_2312_80, .GB_18030_2000],
        "EUC-TW": [.EUC_TW],
        "HZ-GB-2312": [.HZ_GB_2312],
        "ISO-2022-CN": [.ISO_2022_CN, .ISO_2022_CN_EXT],
        "EUC-JP": [.EUC_JP],
        "SHIFT_JIS": [.ShiftJIS, .ShiftJIS_X0213, .ShiftJIS_X0213_MenKuTen],
        "CP932": [.DOSJapanese],
        "ISO-2022-JP": [.ISO_2022_JP, .ISO_2022_JP_1, .ISO_2022_JP_2, .ISO_2022_JP_3],
        "CP949": [.DOSKorean],
        "EUC-KR": [.EUC_KR],
        "ISO-2022-KR": [.ISO_2022_KR],
        "KOI8-R": [.KOI8_R],
        "MacCyrillic": [.MacCyrillic],
        "IBM855": [.DOSCyrillic],
        "IBM866": [.DOSRussian],
        "ISO-8859-5": [.ISOLatinCyrillic],
        "windows-1251": [.WindowsCyrillic],
        "ISO-8859-2": [.ISOLatin2],
        "windows-1250": [.WindowsLatin2],
        "ISO-8859-7": [.ISOLatinGreek],
        "windows-1253": [.WindowsGreek],
        "ISO-8859-8": [.ISOLatinHebrew],
        "windows-1255": [.WindowsHebrew],
        "ISO-8859-9": [.ISOLatin5],
        "TIS-620": [.ISOLatinThai],
    ]
    for (k, v) in miscEncodings {
        encoding_translation[k] = v.map{CFStringConvertEncodingToNSStringEncoding(CFStringEncoding($0.rawValue))}
    }
    return encoding_translation[encoding]!
}
public class CharsetDetectionFailed: ErrorType {}
public class SwiftyChardet {
    public static func detect(data: NSData) -> (String, Double) {
        let bytes: [UInt8] = data.toBytes()
        let u = UniversalDetector()
        u.feed(bytes)
        u.close()
        return u.result
    }
    
    public static func decode(data:NSData) throws -> String {
        let guessedEncoding = SwiftyChardet.detect(data).0
        var content: String? = nil
        for encoding in translateEncoding(guessedEncoding) {
            content = String(data: data, encoding: encoding)
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


