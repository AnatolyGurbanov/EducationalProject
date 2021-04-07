import UIKit
import ScenesCoordinator

extension AppDelegate {
    func showMainScreen() {
        let window = UIWindow()
        self.window = window
        AppRouterImpl().showPokemonsListScene()
    }
}
