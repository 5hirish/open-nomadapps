import XCTest
@testable import YuktaKit

final class BaselineTests: XCTestCase {
    func testNeedsSevenDays() {
        XCTAssertNil(Baseline(values: [50, 51, 52, 53, 54, 55], floor: 3))
        XCTAssertNotNil(Baseline(values: [50, 51, 52, 53, 54, 55, 56], floor: 3))
    }

    func testMedianAndSpread() throws {
        // median 53; deviations 0,1,1,2,2,3,3 → MAD 2 → spread 1.4826 × 2
        let b = try XCTUnwrap(Baseline(values: [56, 50, 53, 51, 55, 52, 54], floor: 1))
        XCTAssertEqual(b.median, 53)
        XCTAssertEqual(b.spread, 2.9652, accuracy: 1e-9)
        XCTAssertEqual(b.days, 7)
    }

    func testEvenCountMedian() {
        XCTAssertEqual(Baseline.median(of: [1, 2, 3, 4, 5, 6, 7, 8]), 4.5)
    }

    func testFloorAppliesToASteadySignal() throws {
        let b = try XCTUnwrap(Baseline(values: Array(repeating: 60, count: 10), floor: 1.5))
        XCTAssertEqual(b.spread, 1.5)
    }

    func testZIsClampedToThree() throws {
        let b = try XCTUnwrap(Baseline(values: Array(repeating: 60, count: 10), floor: 1.5))
        XCTAssertEqual(b.z(61.5), 1, accuracy: 1e-9)
        XCTAssertEqual(b.z(70), 3)
        XCTAssertEqual(b.z(50), -3)
    }
}
