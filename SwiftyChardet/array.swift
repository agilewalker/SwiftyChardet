func len<T>(collection: Array<T>) -> Int {
    return collection.count
}

extension CollectionType where Self.Index == Int {
    subscript(position: UInt8) -> Self.Generator.Element {
        return self[Int(position)]
    }
}

extension Array: BooleanType {
    public var boolValue: Bool {
        return !self.isEmpty
    }
}