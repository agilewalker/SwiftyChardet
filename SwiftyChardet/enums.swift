/// The different states a universal detector can be in.
enum InputState: Int {
    case pure_ascii = 0
    case esc_ascii = 1
    case high_byte = 2
}

struct LanguageFilter: OptionSet {
    let rawValue: Int
    static let chinese_simplified = LanguageFilter(rawValue: 1 << 0)
    static let chinese_traditional = LanguageFilter(rawValue: 1 << 1)
    static let japanese = LanguageFilter(rawValue: 1 << 2)
    static let korean = LanguageFilter(rawValue: 1 << 3)
    static let non_cjk = LanguageFilter(rawValue: 1 << 4)
    static let chinese: LanguageFilter = [chinese_simplified, chinese_traditional]
    static let cjk: LanguageFilter = [chinese, japanese, korean]
    static let all: LanguageFilter = [cjk, non_cjk]
}

/// The different states a prober can be in.
enum ProbingState: Int {
    /*
    This enum represents
    */
    case detecting = 0
    case found_it = 1
    case not_me = 2
}

/// The different states a state machine can be in.
enum MachineState: Int {
    case start = 0
    case error = 1
    case its_me = 2
    case _3 = 3
    case _4 = 4
    case _5 = 5
    case _6 = 6
    case _7 = 7
    case _8 = 8
    case _9 = 9
    case _10 = 10
    case _11 = 11
    case _12 = 12
}
