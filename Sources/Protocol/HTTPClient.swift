import Foundation

/// A protocol-based approach
///
/// Note: The primary reason that I choose not to use this approach is that
/// testing is often the primary reason these protocols are introduced instead
/// of for the need of multiple conformances. There is a runtime performance
/// penalty for dynamic lookups that isn't often needed in the production code.
protocol HTTPClient {
    func get(_ path: String) -> Data
}

struct HTTPClientInstance: HTTPClient {
    func get(_ path: String) -> Data {
        "The meaning of life".data(using: .utf8)!
    }
}

struct Life {
    let value: String
}

struct Service {
    private let client: HTTPClient

    init(client: HTTPClient = HTTPClientInstance()) {
        self.client = client
    }

    func fetch(id: Int) -> Life {
        .init(
            value: .init(
                decoding: client.get("/meaning_of/\(id)"),
                as: UTF8.self
            )
       )
    }
}
