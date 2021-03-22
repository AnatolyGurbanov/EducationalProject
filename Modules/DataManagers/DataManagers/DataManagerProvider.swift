import Foundation

public enum DataManagerProvider {
    public static var pokemonsManager: StorageManager {
        PokemonsManagerImpl()
    }
}
