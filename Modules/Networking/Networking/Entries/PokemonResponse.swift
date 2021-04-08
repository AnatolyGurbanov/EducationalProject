import Foundation
import Extensions

// MARK: - PokemonResponse

struct PokemonResponse: Decodable {
     let id: String
     let name: String
     let supertype: String
     let subtypes: [String]?
     let hp: String?
     let types: [String]?
     let evolvesFrom: String?
     let abilities: [Ability]?
     let attacks: [Attack]?
     let weaknesses : [Resistance]?
     let resistances: [Resistance]?
     let number: String?
     let artist: String?
     let rarity: String?
     let flavorText: String?
     let nationalPokedexNumbers: [Int]?
     let images: DataImages
}

// MARK: - Ability

struct Ability: Decodable {
    let name: String
    let text: String
    let type: String
}

// MARK: - Attack

struct Attack: Decodable {
    let name: String?
    let cost: [String]?
    let convertedEnergyCost: Int?
    let damage: String?
    let text: String?
}

// MARK: - DataImages

struct DataImages: Decodable  {
    let small: URLString
    let large: URLString
}

// MARK: - Resistance

struct Resistance: Decodable  {
    let type: String?
    let value: String?
}
