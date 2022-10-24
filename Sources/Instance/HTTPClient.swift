import Foundation

/// A concrete instance-based approach
///
/// Note: This is my preferred means of "mocking" for testing.
/// This approach allows for maintaining value semantics,
/// eliminating reference behavior. It also has a nice call site
/// ergonmics using Swift's static member lookup syntatic sugar.
struct HTTPClient {
    private var getPath: (String) -> Data

    public init(getPath: @escaping (String) -> Data) {
        self.getPath = getPath
    }

    func get(_ path: String) -> Data {
        getPath(path)
    }
}

extension HTTPClient {
    static let live = Self(getPath: { _ in return "The meaning of life".data(using: .utf8)! })
}

struct Life {
    let value: String
}

struct Service {
    private let client: HTTPClient

    init(client: HTTPClient = .live) {
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
