import Foundation
import Models
import RxSwift

public protocol PokemonUseCase {
    func fetchPokemon(with id: String) -> Single<Pokemon>
    func fetchPokemonImage(with url: URL) -> Single<UIImage>
}
