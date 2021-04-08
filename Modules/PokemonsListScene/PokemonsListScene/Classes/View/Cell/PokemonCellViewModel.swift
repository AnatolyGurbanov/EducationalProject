import Common
import Extensions
import Models
import RxCocoa
import RxDataSources
import UseCases


final class PokemonCellViewModel: ViewModel, Equatable {
    
    struct Props: Equatable {
        var id: String
        var name: String
        var image: URLString
    }

    private let pokemon: Props
    private let useCase: PokemonUseCase

    init(pokemon: Props, dependencies: Dependencies) {
        self.pokemon = pokemon
        self.useCase = dependencies.useCase
    }
    
    func transform(_ input: PokemonCellViewModel.Input, outputHandler: (PokemonCellViewModel.Output) -> Void) {
        let name = Driver.just(pokemon.name)
        let id = Driver.just(pokemon.id)
        
        guard let imageURL = pokemon.image.url else {
            return
        }
        
        let image = useCase.fetchPokemonImage(with: imageURL)
            .asDriver(onErrorJustReturn: UIImage())

        let output = Output(
            name: name,
            id: id,
            image: image
        )

        outputHandler(output)
    }
    
    static func == (lhs: PokemonCellViewModel, rhs: PokemonCellViewModel) -> Bool {
        lhs.pokemon.id == rhs.pokemon.id
    }
}

extension PokemonCellViewModel {
    struct Dependencies {
        let useCase: PokemonUseCase
    }

    struct Input {

    }

    struct Output {
        let name: Driver<String>
        let id: Driver<String>
        let image: Driver<UIImage>
    }
}
