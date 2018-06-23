import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(redux_swiftTests.allTests),
    ]
}
#endif