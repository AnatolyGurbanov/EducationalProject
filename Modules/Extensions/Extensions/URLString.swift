import Foundation

public typealias URLString = String?

extension URLString {
    var url: URL? {
        flatMap { URL(string: $0) }
    }
}
