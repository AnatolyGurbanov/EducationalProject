import RxSwift
import Models

public protocol PokemonsManager {
    func fetchPokemonCards() -> Single<Pokemons>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
    func fetchPokemonCards(with name: String) -> Single<Pokemons>
}
