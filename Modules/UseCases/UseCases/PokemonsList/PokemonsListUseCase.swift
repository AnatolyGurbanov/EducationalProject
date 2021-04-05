import Foundation
import Models
import RxSwift

public protocol PokemonsListUseCase {
    func fetchPokemons() -> Single<[Pokemon]>
    func fetchPokemons(with name: String) -> Single<[Pokemon]>
}
