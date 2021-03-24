import Foundation
import Models
import RxSwift

public protocol PokemonUseCase {
    func fetchPokemon(with id: String) -> Single<Pokemon>
}
