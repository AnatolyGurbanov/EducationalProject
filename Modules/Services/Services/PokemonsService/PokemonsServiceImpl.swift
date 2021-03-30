import Foundation
import DataManagers
import Extensions
import Models
import RxSwift

final class PokemonsServiceImpl: PokemonsServiceProtocol {
    private let pokemonsManager: PokemonsManagerProtocol
    private let disposeBag = DisposeBag()
  
    init(pokemonsManager: PokemonsManagerProtocol) {
        self.pokemonsManager = pokemonsManager
    }

    func fetchPokemonCards() -> Single<Pokemons> {
        pokemonsManager.fetchPokemonCards()
    }

    func fetchPokemonCard(with id: String) -> Single<Pokemon> {
        pokemonsManager.fetchPokemonCard(with: id)
        
    }

    func fetchPokemonCards(with name: String) -> Single<Pokemons> {
        pokemonsManager.fetchPokemonCards(with: name)
    }
    
    func fetchPokemonImage(with url: URL) -> Single<UIImage> {
        pokemonsManager.fetchPokemonImage(with: url)
    }
}
