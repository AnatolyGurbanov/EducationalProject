import Foundation
import RxSwift
import Models
import Networking

final class PokemonsManagerImpl: PokemonsManager {

    private let provider: CardsNetworkServiceProtocol
    
    init() {
        self.provider = NetworkServiceProvider.cardsAPIService
    }

    func fetchPokemonCards() -> Single<Pokemons> {
        provider.fetchPokemonCard()
    }

    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        provider.fetchPokemonCards()
    }
}
