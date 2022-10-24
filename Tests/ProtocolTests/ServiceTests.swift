import XCTest
@testable import Protocol

final class MockHTTPClient: HTTPClient {
    private(set) var getCallCount = 0
    private(set) var getArgs: [String] = []
    var getReturns: Data!

    func get(_ path: String) -> Data {
        getCallCount += 1
        getArgs.append(path)
        return getReturns
    }
}

final class ServiceTests: XCTestCase {
    func testFetch() throws {
        let client = MockHTTPClient()
        client.getReturns = "".data(using: .utf8)!

        let service = Service(client: client)
        XCTAssertEqual(0, client.getCallCount)

        _ = service.fetch(id: 42)
        XCTAssertEqual(1, client.getCallCount)
        XCTAssertEqual(client.getArgs.first!, "/meaning_of/42")
    }
}
