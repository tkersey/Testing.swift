import XCTest
@testable import Instance

extension HTTPClient {
    static func mock(getPath: @escaping (String) -> Data) -> Self {
        .init(getPath: getPath)
    }
}

final class ServiceTests: XCTestCase {
    func testFetch() throws {
        var parameter = ""

        let service = Service(
            client: .mock(getPath: { parameter = $0; return "".data(using: .utf8)! })

        )

        _ = service.fetch(id: 42)
        XCTAssertEqual(parameter, "/meaning_of/42")
    }
}
