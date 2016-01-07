import Foundation

extension UInt8 {
    func isalpha() -> Bool {
        return (self >= 0x41 && self <= 0x5a) || (self >= 0x61 && self <= 0x7a)
    }
    
    func isinternational() -> Bool {
        return self >= 0x80 && self <= 0xFF
    }
    
    func ismarker() -> Bool {
        return !(self.isalpha() || self.isinternational())
    }
}