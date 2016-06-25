func len<T>(_ collection: Array<T>) -> Int {
    return collection.count
}

extension Collection where Self.Index == Int {
    subscript(position: UInt8) -> Self.Iterator.Element {
        return self[Int(position)]
    }
}

extension Array: Boolean {
    public var boolValue: Bool {
        return !self.isEmpty
    }
}
