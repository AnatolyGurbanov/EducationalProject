import RxSwift
import Models
import Networking

final class PokemonsManagerImpl: PokemonsManagerProtocol {

    private let provider: CardsNetworkServiceProtocol
    
    init() {
        self.provider = NetworkServiceProvider.cardsAPIService
    }

    func fetchPokemonCards() -> Single<Pokemons> {
        provider.fetchPokemonCards()
    }

    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        provider.fetchPokemonCard(with: id)
    }
    
    func fetchPokemonCards(with name: String) -> Single<Pokemons> {
        provider.fetchPokemonCards(with: name)
    }
    
    func fetchPokemonImage(with url: URL) -> Single<UIImage> {
        provider.fetchPokemonImage(with: url)
    }
}
