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
    public let name, text, type: String
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
    public let id, name, series: String
    public let printedTotal, total: Int
    public let legalities: Legalities
    public let ptcgoCode, releaseDate, updatedAt: String
    public let images: SetImages
}

// MARK: - SetImages

public struct SetImages: Decodable {
    public let symbol, logo: String
}

// MARK: - Legalities

public struct Legalities: Decodable {
    public let unlimited, expanded: String
}

// MARK: - DataImages

public struct DataImages: Decodable  {
    public let small, large: String
}

// MARK: - Resistance

public struct Resistance: Decodable  {
    public let type, value: String
}

// MARK: - Tcgplayer

public struct Tcgplayer: Decodable  {
    public let url: String
    public let updatedAt: String
    public let prices: Prices
}

// MARK: - Prices

public struct Prices: Decodable  {
    public let holofoil, reverseHolofoil: Holofoil
}

// MARK: - Holofoil

public struct Holofoil: Decodable  {
    public let low, mid, high, market: Double
}
