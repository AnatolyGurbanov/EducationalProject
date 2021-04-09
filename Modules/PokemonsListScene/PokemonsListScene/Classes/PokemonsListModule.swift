import Routing
import UIKit
import UseCases

public struct PokemonsListModule {
    public let view: UIViewController
    
    public init(router: PokemonsListRouter, transition: Transition?) {
        let pokemonsListUseCase = PokemonsListUseCaseImpl()
        let pokemonUseCase = PokemonUseCaseImpl()

        let viewModelDependencies = PokemonsListViewModel.Dependencies(
            useCase: pokemonsListUseCase,
            cellViewModelUseCase: pokemonUseCase,
            router: router
        )
        
        let viewModel = PokemonsListViewModel(dependencies: viewModelDependencies)

        let viewDependencies = PokemonsListViewController.Dependencies(
            viewModel: viewModel
        )

        let view = PokemonsListViewController(dependencies: viewDependencies)
        router.viewController = view
        router.openTransition = transition

        self.view = view
    }
}

