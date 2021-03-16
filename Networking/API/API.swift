//
//  API.swift
//  Networking
//
//  Created by Anatoly Gurbanov on 15.03.2021.
//

import Foundation
import Moya

enum API {
    case cards
    case cardsID(id: String)
}

extension API: TargetType {

    var baseURL: URL {
        URL(string: "https://api.pokemontcg.io/v2")!
    }
    
    var path: String {
        switch self {
        case .cards:
            return "/cards"
        case .cardsID(let id):
            return "/cards/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        nil
    }

}
