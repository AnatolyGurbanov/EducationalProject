import UIKit
import UseCases

public struct PokemonsListModule {
    public let view: UIViewController
    
    public init() {
        let useCase = PokemonsListUseCaseImpl()

        let viewModelDependencies = PokemonsListViewModel.Dependencies(
            useCase: useCase
        )
        let viewModel = PokemonsListViewModel(dependencies: viewModelDependencies)

        let viewDependencies = PokemonsListViewController.Dependencies(
            viewModel: viewModel
        )

        let view = PokemonsListViewController(dependencies: viewDependencies)

        self.view = view
    }
}

