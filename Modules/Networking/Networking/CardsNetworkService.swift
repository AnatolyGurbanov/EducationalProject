import Models
import Moya
import RxSwift

public protocol CardsNetworkServiceProtocol {
    func fetchPokemonCards() -> Single<[Pokemon]>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
    func fetchPokemonCards(with name: String) -> Single<[Pokemon]>
    func fetchPokemonImage(with url: URL) -> Single<UIImage>
}

final class CardsNetworkServiceImpl {
    
    private let provider: MoyaProvider<PokemonsAPI>
    
    init() {
        self.provider = MoyaProvider<PokemonsAPI>()
    }
}

extension CardsNetworkServiceImpl: CardsNetworkServiceProtocol {

    func fetchPokemonCards() -> Single<[Pokemon]> {
        return provider.rx.request(.cards)
            .filterSuccessfulStatusCodes()
            .map([PokemonResponse].self, atKeyPath: "data", using: JSONDecoder())
            .map { pokemons in
                pokemons.map {
                    Pokemon(
                        id: $0.id,
                        name: $0.name,
                        imageURL: $0.images.large
                    )
                }
            }
            .catchError(ErrorHandler.handleError)
    }
    
    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        return provider.rx.request(.cardsID(id: id))
            .filterSuccessfulStatusCodes()
            .map(PokemonResponse.self)
            .map {
                return Pokemon(
                    id: $0.id,
                    name: $0.name,
                    imageURL: $0.images.large
                )
            }
            .catchError(ErrorHandler.handleError)
    }
    
    func fetchPokemonCards(with name: String) -> Single<[Pokemon]> {
        return provider.rx.request(.cardsName(name: name))
            .filterSuccessfulStatusCodes()
            .map([PokemonResponse].self, atKeyPath: "data", using: JSONDecoder())
            .map { pokemons in
                pokemons.map {
                    Pokemon(
                        id: $0.id,
                        name: $0.name,
                        imageURL: $0.images.large
                    )
                }
            }
            .catchError(ErrorHandler.handleError)
    }

    func fetchPokemonImage(with url: URL) -> Single<UIImage> {
        return provider.rx.request(.image(url: url))
            .mapImage()
            .catchError(ErrorHandler.handleError)
    }
}
