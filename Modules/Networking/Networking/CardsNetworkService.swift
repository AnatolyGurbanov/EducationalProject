import Models
import Foundation
import Moya
import RxSwift

public protocol CardsNetworkServiceProtocol {
    func fetchPokemonCards() -> Single<Pokemons>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
}

final class CardsNetworkServiceImpl {
    
    private let provider: MoyaProvider<PokemonsAPI>
    
    init() {
        self.provider = MoyaProvider<PokemonsAPI>()
    }
}

extension CardsNetworkServiceImpl: CardsNetworkServiceProtocol {

    func fetchPokemonCards() -> Single<Pokemons> {
        return provider.rx.request(.cards)
            .filterSuccessfulStatusCodes()
            .map(Pokemons.self)
            .map { response -> Pokemons in
                return response
            }
            .catchError(ErrorHandler.handleError)
    }
    
    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        return provider.rx.request(.cardsID(id: id))
            .filterSuccessfulStatusCodes()
            .map(Pokemon.self)
            .map { response -> Pokemon in
                return response
            }
            .catchError(ErrorHandler.handleError)
    }
}
