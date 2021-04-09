import Foundation
import DataManagers

public enum ServiceProvider {
    static public func pokemonsService() -> PokemonsServiceProtocol {
        PokemonsServiceImpl(
            pokemonsManager: DataManagerProvider.pokemonsManager
        )
    }
}
