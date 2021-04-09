import Foundation
import UseCases
import Common

enum PropsMapper {
    static func map(from pokemons: [PokemonCellViewModel]) -> PokemonsListViewController.Props {
        if let pokemons = pokemonProps(from: pokemons) {
            return .pokemon(pokemons)
        }

        return .none
    }
    
    static func pokemonProps(from pokemons: [PokemonCellViewModel]) -> [GenericSection<PokemonCellViewModel>]? {
        [GenericSection(title: "pokemons", items: pokemons)]
    }
}
