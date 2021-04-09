import Extensions
import UIKit

// MARK: - Pokemon

public struct Pokemon: Equatable {
    public let id: String
    public let name: String
    public let imageURL: URLString
    
    public init(
        id: String,
        name: String,
        imageURL: URLString
    ) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
}
