import Common
import Extensions
import Models
import RxSwift
import RxCocoa
import SnapKit
import UIKit
import UseCases

final class PokemonsListViewModel {
    private let moduleUseCase: PokemonsListUseCase
    private let cellViewModelUseCase: PokemonUseCase
    private let router: PokemonsListRouter

    init(dependencies: Dependencies) {
        moduleUseCase = dependencies.useCase
        cellViewModelUseCase = dependencies.cellViewModelUseCase
        router = dependencies.router
    }

    func transform(_ input: Input, outputHandler: (Output) -> Void) {

        let pokemons = moduleUseCase.fetchPokemons()

        let props = pokemons
            .asObservable()
            .map(makeCellViewModels)
            .map { pokemons -> PokemonsListViewController.Props in
                return PropsMapper.map(from: pokemons)
            }
            .distinctUntilChanged()
        
        input.loadTrigger
            .drive(onNext: { [moduleUseCase] _ in
                moduleUseCase.fetchPokemons()
            })
            .disposed(by: input.disposeBag)

        outputHandler(
            Output(props: props)
        )
    }
}

extension PokemonsListViewModel {
    private func makeCellViewModels(from pokemons: [Pokemon]) -> [PokemonCellViewModel] {
        return pokemons
            .map({
                let props = PokemonCellViewModel.Props(
                    id: $0.id,
                    name: $0.name,
                    image: $0.imageURL
                )
                let cellViewModelDependencies = PokemonCellViewModel.Dependencies(useCase: cellViewModelUseCase)
                return PokemonCellViewModel(pokemon: props, dependencies: cellViewModelDependencies)
            })
    }
}

// MARK: - Container

extension PokemonsListViewModel {
    struct Dependencies {
        let useCase: PokemonsListUseCase
        let cellViewModelUseCase: PokemonUseCase
        let router: PokemonsListRouter
    }

    struct Input {
        let disposeBag: DisposeBag
        let loadTrigger: Driver<Void>
    }

    struct Output {
        let props: Observable<PokemonsListViewController.Props>
    }
}

