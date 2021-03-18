//
//  NetworkServiceAssembly.swift
//  Networking
//
//  Created by Anatoly Gurbanov on 15.03.2021.
//

import Swinject
import Domain

class CardsNetworkAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CardsNetworkServiceProtocol.self) { _ in
            return CardsNetworkServiceImpl()
        }
    }
}
