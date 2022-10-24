import XCTest
@testable import Inheritance

final class MockHTTPClient: HTTPClient {
    private(set) var getArgs: [String] = []
    var getReturns: Data!

    override func get(_ path: String) -> Data {
        getArgs.append(path)
        return getReturns
    }
}

final class ServiceTests: XCTestCase {
    func testFetch() throws {
        let client = MockHTTPClient()
        client.getReturns = "meaningOfLife".data(using: .utf8)!

        let service = Service(client: client)

        _ = service.fetch(id: 42)
        XCTAssertEqual(client.getArgs.first!, "/meaning_of/42")
    }
}
