//
//  CardsNetworkService.swift
//  Networking
//
//  Created by Anatoly Gurbanov on 16.03.2021.
//

import Domain
import Foundation
import Moya
import RxSwift

class CardsNetworkServiceImpl: Domain.CardsNetworkServiceProtocol {
    
    let provider: MoyaProvider<API>
    
    init() {
        self.provider = MoyaProvider<API>(plugins: [
            APITokenPlugin()
        ])
    }
    
    func fetchPokemonCards() -> Single<Domain.Pokemons> {
        return provider.rx.request(.cards)
            .filterSuccessfulStatusCodes()
            .map(Domain.Pokemons.self)
            .map { response -> Domain.Pokemons in
                return response
            }
            .do(onSuccess: { items in
                print("items:", items)
            }, onError: {
                print("error:", $0)
            })
    }
    
    func fetchPokemonCard(with id: String) -> Single<Domain.Pokemon> {
        return provider.rx.request(.cardsID(id: id))
            .filterSuccessfulStatusCodes()
            .map(Domain.Pokemon.self)
            .map { response -> Domain.Pokemon in
                return response
            }
            .do(onSuccess: { item in
                print("pokemon's name:", item.name)
            }, onError: {
                print("error:", $0)
            })
    }
}
