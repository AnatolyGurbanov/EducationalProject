//
//  Provider.swift
//  Networking
//
//  Created by Anatoly Gurbanov on 15.03.2021.
//

import Domain
import Foundation
import Swinject

public class NetworkServiceProvider {

    private let container: Container
    private let assembler: Assembler
    
    public init(container: Container = Container()) {
        self.container = container
        
        assembler = Assembler(
            [CardsNetworkAssembly()],
            container: container
        )
    }
    
    public func asResolver() -> Resolver {
        return assembler.resolver
    }
}
