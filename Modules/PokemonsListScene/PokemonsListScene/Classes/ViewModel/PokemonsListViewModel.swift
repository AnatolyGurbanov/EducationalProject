import Extensions
import Models
import RxSwift
import RxCocoa
import SnapKit
import UIKit
import UseCases

final class PokemonsListViewModel {
    private let useCase: PokemonsListUseCase
    
    init(dependencies: Dependencies) {
        useCase = dependencies.useCase
    }
    
    func transform(_ input: Input, outputHandler: (Output) -> Void) {
        
        let pokemons = useCase.fetchPokemons()
        
        let props = pokemons
            .asObservable()
            .map { pokemons -> PokemonsListViewController.Props in
                return PropsMapper.map(from: pokemons)
            }
        
        outputHandler(
            Output(props: props)
        )
    }
}

// MARK: - Container

extension PokemonsListViewModel {
    struct Dependencies {
        let useCase: PokemonsListUseCase
    }
    
    struct Input {
        let disposeBag: DisposeBag
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let props: Observable<PokemonsListViewController.Props>
    }
}

