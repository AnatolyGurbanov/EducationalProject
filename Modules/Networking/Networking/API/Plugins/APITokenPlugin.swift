//
//  APITokenPlugin.swift
//  Networking
//
//  Created by Anatoly Gurbanov on 16.03.2021.
//

import Foundation
import Moya

struct APITokenPlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        let APIKey = Constants.apiPrivateKey
        
        var request = request
        request.addValue(APIKey, forHTTPHeaderField: "X-Api-Key")
        return request
    }
}

