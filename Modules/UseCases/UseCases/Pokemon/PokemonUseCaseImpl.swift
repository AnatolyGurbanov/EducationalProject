import DataManagers
import Foundation
import Models
import RxSwift

public class PokemonUseCaseImpl: PokemonUseCase {
    
    private let service: PokemonsManager
    
    init(service: PokemonsManager) {
        self.service = service
    }
    
    public func fetchPokemon(with id: String) -> Single<Pokemon> {
        service.fetchPokemonCard(with: id)
    }
}
