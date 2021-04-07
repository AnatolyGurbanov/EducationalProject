import Foundation
import Routing
import PokemonsListScene

extension Routing.ScenePokemonsListRoute where Self: RouterProtocol {
    public func showPokemonsListScene() {
        let transition = WindowNavigationTransition()
        let module = PokemonsListModule(
            router: ScenePokemonsListRouterImpl(),
            transition: transition
        )
        
        open(module.view, transition: transition)
    }
}

final class ScenePokemonsListRouterImpl: Router2, PokemonsListRouter {}
