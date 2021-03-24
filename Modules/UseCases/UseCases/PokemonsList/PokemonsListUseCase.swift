import Foundation
import Models
import RxSwift

public protocol PokemonsListUseCase {
    func fetchPokemons() -> Single<Pokemons>
    func fetchPokemons(with name: String) -> Single<Pokemons>
}
