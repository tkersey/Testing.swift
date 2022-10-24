import Foundation

/// An inheritance-based approach
///
/// Note: The primary reason that I choose not to use this approach is that
/// it requires using `class`es which introduces—possibly unintended—reference behavior
/// (reference semantics), that can lead to unexpected changes by any code that
///  maintains a variable to that reference. Swift has `struct`s for value semnantics.
class HTTPClient {
    func get(_ path: String) -> Data {
        "The meaning of life".data(using: .utf8)!
    }
}

struct Life {
    let value: String
}

struct Service {
    private let client: HTTPClient

    init(client: HTTPClient = HTTPClient()) {
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
