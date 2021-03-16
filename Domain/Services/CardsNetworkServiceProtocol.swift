//
//  CardsNetworkService.swift
//  Domain
//
//  Created by Anatoly Gurbanov on 15.03.2021.
//

import Foundation
import RxSwift

public protocol CardsNetworkServiceProtocol {
    func fetchPokemonCards() -> Single<Pokemons>
    func fetchPokemonCard(with id: String) -> Single<Pokemon>
}
