import RxSwift
import Models

public protocol PokemonsManagerProtocol {
    func fetchPokemonCards() -> Single<[Pokemon]>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
    func fetchPokemonCards(with name: String) -> Single<[Pokemon]>
    func fetchPokemonImage(with url: URL) -> Single<UIImage>
}
