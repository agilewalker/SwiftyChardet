SwiftyChardet: The Universal Character Encoding Detector
--------------------------------------------------------
Detects
 - ASCII, UTF-8, UTF-16, UTF-32
 - Big5, GB2312, EUC-TW, HZ-GB-2312, ISO-2022-CN (Traditional and Simplified Chinese)
 - EUC-JP, SHIFT_JIS, CP932, ISO-2022-JP (Japanese)
 - EUC-KR, ISO-2022-KR (Korean)
 - KOI8-R, MacCyrillic, IBM855, IBM866, ISO-8859-5, windows-1251 (Cyrillic)
 - ISO-8859-5, windows-1251 (Bulgarian)
 - windows-1252 (English)
 - ISO-8859-7, windows-1253 (Greek)
 - ISO-8859-8, windows-1255 (Visual and Logical Hebrew)
 - TIS-620 (Thai)

Usage
-----
::

    let data: Data = ... // a Data instance with unknown encoding
    let (encoding: String, confidence: Double) =  SwiftyChardet.detect(data)

::

    let data: Data = ... // a Data instance with unknown encoding
    let text: String? = try? SwiftyChardet.decode(data)

Install
-------
::

   pod install SwiftyChardet

Swift 2
-------
For projects depends on Swift 2,  Stick to 1.x branch
