import RxSwift
import Models
import Networking

final class PokemonsManagerImpl: PokemonsManager {

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
}
