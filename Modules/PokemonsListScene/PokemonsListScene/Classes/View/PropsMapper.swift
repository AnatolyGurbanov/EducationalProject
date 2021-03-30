import Common
import Models
import Foundation
import UseCases

enum PropsMapper {

    static func map(from pokemons: Pokemons) -> PokemonsListViewController.Props {
        if let pokemons = pokemonsCellProps(from: pokemons) {
            return .pokemons(pokemons)
        }

        return .none
    }

    static func pokemonsCellProps(from pokemons: Pokemons) -> [GenericSection<PokemonCollectionViewCell.Props>]? {
        let items = pokemons.pokemons.map {
            PokemonCollectionViewCell.Props(id: $0.name, image: $0.image)
        }

        return [GenericSection(title: "contacts", items: items)]
    }
}
