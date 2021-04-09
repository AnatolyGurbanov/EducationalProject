import UIKit
import Routing

public protocol AppRouter:
    Closable,
    ScenePokemonsListRoute {
}

public final class AppRouterImpl: Routing.Router<UIViewController>, AppRouter {}
