import Foundation

public func len(_ x: String) -> Int {
    return (x as NSString).length
}

extension String : Boolean {
    
    public var boolValue: Bool {
        return !self.isEmpty
    }
      
    subscript(r: Range<Int>) -> String {
        return (self as NSString).substring(with: NSMakeRange(r.lowerBound, r.upperBound - r.lowerBound))
    }
}
