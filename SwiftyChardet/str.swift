import Foundation

public func len(x: String) -> Int {
    return (x as NSString).length
}

extension String : BooleanType {
    
    public var boolValue: Bool {
        return !self.isEmpty
    }
    
    func startswith(prefix: String) -> Bool {
        return self.hasPrefix(prefix)
    }
    
    subscript(r: Range<Int>) -> String {
        return (self as NSString).substringWithRange(NSMakeRange(r.startIndex, r.endIndex - r.startIndex))
    }
}
