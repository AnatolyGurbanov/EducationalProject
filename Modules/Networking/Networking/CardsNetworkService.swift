import Models
import Foundation
import Moya
import RxSwift

public protocol CardsNetworkServiceProtocol {
    func fetchPokemonCards() -> Single<Pokemons>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
}

private final class CardsNetworkServiceImpl {
    
    let provider: MoyaProvider<PokemonsAPI>
    
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
            .do(onSuccess: { items in
                print("items:", items)
            }, onError: {
                print("error:", $0)
            })
    }
    
    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        return provider.rx.request(.cardsID(id: id))
            .filterSuccessfulStatusCodes()
            .map(Pokemon.self)
            .map { response -> Pokemon in
                return response
            }
            .do(onSuccess: { item in
                print("pokemon's name:", item.name)
            }, onError: {
                print("error:", $0)
            })
    }
}
