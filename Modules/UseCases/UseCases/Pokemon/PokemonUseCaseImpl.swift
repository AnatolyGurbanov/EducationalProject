import Foundation
import Models
import RxSwift
import Services

public class PokemonUseCaseImpl: PokemonUseCase {
    
    private let service: PokemonsServiceProtocol
    
    init(service: PokemonsServiceProtocol) {
        self.service = service
    }
    
    public func fetchPokemon(with id: String) -> Single<Pokemon> {
        service.fetchPokemonCard(with: id)
    }
}
