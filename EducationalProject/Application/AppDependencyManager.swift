//
//  AppDependencyManager.swift
//  EducationalProject
//
//  Created by Anatoly Gurbanov on 16.03.2021.
//

import Swinject
import Domain
import Networking

class AppDependencyManager {
    
    static let shared = AppDependencyManager()
    
    private let container: Container
    
    var resolver: Resolver {
        return container
    }
    
    private init() {
        let container = Container()
        
        container.register(NetworkServiceProvider.self, factory: { _ in
            return NetworkServiceProvider(container: container)
        })
        
        container.register(UseCaseProvider.self, factory: {
            let serviceResolver: Resolver = $0.resolve(NetworkServiceProvider.self)
                .asResolver()
            
            return UseCaseProvider(container: container, serviceResolver: serviceResolver)
        })
        
        self.container = container
    }
}
