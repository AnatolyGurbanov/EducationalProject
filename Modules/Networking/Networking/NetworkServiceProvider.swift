public enum NetworkServiceProvider {
    public static var cardsAPIService: CardsNetworkServiceProtocol {
        CardsNetworkServiceImpl()
    }
}
