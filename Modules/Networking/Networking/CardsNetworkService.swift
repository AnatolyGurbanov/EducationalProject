import Models
import Moya
import RxSwift

public protocol CardsNetworkServiceProtocol {
    func fetchPokemonCards() -> Single<Pokemons>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
    func fetchPokemonCards(with name: String) -> Single<Pokemons>
    func fetchPokemonImage(with url: URL) -> Single<UIImage>
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
            .catchError(ErrorHandler.handleError)
    }
    
    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        return provider.rx.request(.cardsID(id: id))
            .filterSuccessfulStatusCodes()
            .map(Pokemon.self)
            .catchError(ErrorHandler.handleError)
    }
    
    func fetchPokemonCards(with name: String) -> Single<Pokemons> {
        return provider.rx.request(.cardsName(name: name))
            .filterSuccessfulStatusCodes()
            .map(Pokemons.self)
            .catchError(ErrorHandler.handleError)
    }

    func fetchPokemonImage(with url: URL) -> Single<UIImage> {
        return provider.rx.request(.image(url: url))
            .mapImage()
            .catchError(ErrorHandler.handleError)
    }
}
