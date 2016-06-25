import Foundation

public func len(_ d: Data) -> Int {
    return d.count
}

extension Data: Boolean {
    subscript(r: Range<Int>) -> Data {
        return self.subdata(in: r)
    }
    
    mutating func append(byte i: Int) {
        self.append(Data(bytes:[UInt8(i)]))
    }
    
    public var boolValue: Bool {
        return !self.isEmpty
    }
}
