import UIKit
import UseCases

public struct PokemonsListModule {
    public let view: UIViewController
    
    public init() {
        let pokemonsListUseCase = PokemonsListUseCaseImpl()
        let pokemonUseCase = PokemonUseCaseImpl()

        let viewModelDependencies = PokemonsListViewModel.Dependencies(
            useCase: pokemonsListUseCase,
            cellViewModelUseCase: pokemonUseCase
        )
        
        let viewModel = PokemonsListViewModel(dependencies: viewModelDependencies)

        let viewDependencies = PokemonsListViewController.Dependencies(
            viewModel: viewModel
        )

        let view = PokemonsListViewController(dependencies: viewDependencies)

        self.view = view
    }
}

