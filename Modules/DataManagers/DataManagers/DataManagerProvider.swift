import Foundation

public enum DataManagerProvider {
    public static var pokemonsManager: PokemonsManagerProtocol {
        PokemonsManagerImpl()
    }
}
