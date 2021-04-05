import Foundation
import Models
import RxSwift
import Services

public class PokemonUseCaseImpl: PokemonUseCase {

    private let service: PokemonsServiceProtocol

    public init() {
        self.service = ServiceProvider.pokemonsService()
    }

    public func fetchPokemon(with id: String) -> Single<Pokemon> {
        service.fetchPokemonCard(with: id)
    }

    public func fetchPokemonImage(with url: URL) -> Single<UIImage> {
        service.fetchPokemonImage(with: url)
    }
}
