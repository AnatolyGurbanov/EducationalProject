import Constants
import Foundation
import Moya

enum PokemonsAPI {
    case cards
    case cardsID(id: String)
}

extension PokemonsAPI: TargetType {

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
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        .requestPlain
    }

    var headers: [String : String]? {
        ["X-Api-Key": Constants.apiPrivateKey]
    }

}
