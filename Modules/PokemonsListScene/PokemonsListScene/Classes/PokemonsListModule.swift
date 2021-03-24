import UIKit

public struct PokemonsListModule {
    public let view: UIViewController
    
    public init(router: SomeRouter, transition: Transition?) {
//        let useCase = SignInUseCaseImpl()

        let viewModelDependencies = PokemonsListViewModel.Dependencies(
//            useCase: useCase,
//            router: router
        )
        let viewModel = PokemonsListViewModel(dependencies: viewModelDependencies)

        let viewDependencies = PokemonsListViewController.Dependencies(
            viewModel: viewModel
        )

        let view = PokemonsListViewController

        self.view = view
    }
}

