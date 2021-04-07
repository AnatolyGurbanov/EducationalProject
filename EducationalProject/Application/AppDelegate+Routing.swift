import UIKit
import ScenesCoordinator

extension AppDelegate {
    func showMainScreen() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        AppRouterImpl().showPokemonsListScene()
    }
}
