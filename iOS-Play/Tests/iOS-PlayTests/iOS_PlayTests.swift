import XCTest
@testable import iOS_Play

final class iOS_PlayTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(iOS_Play().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
