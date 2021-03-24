import DataManagers
import Foundation
import Models
import RxSwift

public class PokemonsListUseCaseImpl: PokemonsListUseCase {
    
    private let service: PokemonsManager
    
    init(service: PokemonsManager) {
        self.service = service
    }
    
    public func fetchPokemons() -> Single<Pokemons> {
        service.fetchPokemonCards()
    }
    
    public func fetchPokemons(with name: String) -> Single<Pokemons> {
        service.fetchPokemonCards(with: name)
    }
}
