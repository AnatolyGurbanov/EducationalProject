import Foundation
import RxSwift

public protocol PokemonsUseCase {
    func getPokemonsCards() -> Single<Pokemons>
    func getPokemonCard(with id: String) -> Single<Pokemon>
}

class PokemonsUseCaseImpl: PokemonsUseCase {

    private let cardsNetworkService: CardsNetworkServiceProtocol
    
    init(cardsNetworkService: CardsNetworkServiceProtocol) {
        self.cardsNetworkService = cardsNetworkService
    }
    
    func getPokemonsCards() -> Single<Pokemons> {
        return cardsNetworkService.fetchPokemonCards()
    }

    func getPokemonCard(with id: String) -> Single<Pokemon> {
        return cardsNetworkService.fetchPokemonCard(with: id)
    }
}
