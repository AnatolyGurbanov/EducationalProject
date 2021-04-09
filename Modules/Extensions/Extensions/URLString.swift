import Foundation

public typealias URLString = String?

extension URLString {
    public var url: URL? {
        flatMap { URL(string: $0) }
    }
}
