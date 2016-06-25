/// To use reduce() to sum a sequence, we need
///
/// - a zero (identity) element
/// - an addition operator

protocol Summable {

    /// Identity element for this type and the + operation.
    static var Zero: Self { get }

    /// + operator must be defined for this type
    func +(lhs: Self, rhs: Self) -> Self
}

extension Sequence where Iterator.Element:Summable {

    /// Return sum of all values in the sequence
    func sum() -> Iterator.Element {
        return self.reduce(Iterator.Element.Zero, combine: +)
    }
}

// Define Zero for Int, Double, and String so we can sum() them.
//
// Extend this to any other types for which you want to use sum().

extension Int: Summable {
    /// The Int value 0
    static var Zero: Int = 0
}

extension Float: Summable {
    /// Empty string
    static var Zero: Float = 0.0
}

extension Double: Summable {
    /// The Double value 0.0
    static var Zero: Double = 0.0
}


