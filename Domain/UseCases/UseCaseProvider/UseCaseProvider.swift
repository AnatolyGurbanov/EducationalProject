//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Anatoly Gurbanov on 16.03.2021.
//

import Swinject

public class UseCaseProvider {
    private let container: Container
    private let assembler: Assembler
    
    public init(container: Container = Container(), serviceResolver: Resolver) {
        self.container = container
        
        assembler = Assembler(
            [],
            container: container
        )
    }
}
