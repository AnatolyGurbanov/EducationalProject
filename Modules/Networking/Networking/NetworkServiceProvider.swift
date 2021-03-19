import Foundation

public enum NetworkServiceProvider {
    public static var contactsAPIService: CardsNetworkServiceProtocol {
        CardsNetworkServiceImpl()
    }
}
