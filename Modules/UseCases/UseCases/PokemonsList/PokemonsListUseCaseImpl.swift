import Foundation
import Models
import RxSwift
import Services

public class PokemonsListUseCaseImpl: PokemonsListUseCase {
    
    private let service: PokemonsServiceProtocol
    
    public init() {
        self.service = ServiceProvider.pokemonsService()
    }
    
    public func fetchPokemons() -> Single<Pokemons> {
        service.fetchPokemonCards()
    }
    
    public func fetchPokemons(with name: String) -> Single<Pokemons> {
        service.fetchPokemonCards(with: name)
    }
}
