import Foundation
import Extensions

// MARK: - Pokemon

public struct Pokemon: Decodable {
    public let id: String
    public let name: String
    public let supertype: String
    public let subtypes: [String]
    public let hp: String
    public let types: [String]
    public let evolvesFrom: String
    public let abilities: [Ability]
    public let attacks: [Attack]
    public let weaknesses : [Resistance]
    public let resistances: [Resistance]
    public let number: String
    public let artist: String
    public let rarity: String
    public let flavorText: String
    public let nationalPokedexNumbers: [Int]
    public let images: DataImages
}

// MARK: - Ability

public struct Ability: Decodable {
    public let name: String
    public let text: String
    public let type: String
}

// MARK: - Attack

public struct Attack: Decodable {
    public let name: String
    public let cost: [String]
    public let convertedEnergyCost: Int
    public let damage, text: String
}

// MARK: - DataImages

public struct DataImages: Decodable  {
    public let small: URLString
    public let large: URLString
}

// MARK: - Resistance

public struct Resistance: Decodable  {
    public let type: String
    public let value: String
}
