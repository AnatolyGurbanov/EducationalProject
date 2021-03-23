import Foundation

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
    public let retreatCost: [String]
    public let convertedRetreatCost: Int
    public let dataSet: Set
    public let number: String
    public let artist: String
    public let rarity: String
    public let flavorText: String
    public let nationalPokedexNumbers: [Int]
    public let legalities: Legalities
    public let images: DataImages
    public let tcgplayer: Tcgplayer
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

// MARK: - Set

public struct Set: Decodable {
    public let id: String
    public let name: String
    public let series: String
    public let printedTotal: Int
    public let total: Int
    public let legalities: Legalities
    public let ptcgoCode: String
    public let releaseDate: String
    public let updatedAt: String
    public let images: SetImages
}

// MARK: - SetImages

public struct SetImages: Decodable {
    public let symbol: String
    public let logo: String
}

// MARK: - Legalities

public struct Legalities: Decodable {
    public let unlimited: String
    public let expanded: String
}

// MARK: - DataImages

public struct DataImages: Decodable  {
    public let small: String
    public let large: String
}

// MARK: - Resistance

public struct Resistance: Decodable  {
    public let type: String
    public let value: String
}

// MARK: - Tcgplayer

public struct Tcgplayer: Decodable  {
    public let url: String
    public let updatedAt: String
    public let prices: Prices
}

// MARK: - Prices

public struct Prices: Decodable  {
    public let holofoil: Holofoil
    public let reverseHolofoil: Holofoil
}

// MARK: - Holofoil

public struct Holofoil: Decodable  {
    public let low: Double
    public let mid: Double
    public let high: Double
    public let market: Double
}
