import RxSwift
import Models

public protocol PokemonsManagerProtocol {
    func fetchPokemonCards() -> Single<Pokemons>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
    func fetchPokemonCards(with name: String) -> Single<Pokemons>
    func fetchPokemonImage(with url: URL) -> Single<UIImage>
}
