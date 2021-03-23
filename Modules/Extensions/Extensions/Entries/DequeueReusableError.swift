import Foundation

enum DequeueReusableError {
    case cellWithIdentifier(_ id: String)
    case viewWithIdentifier(_ id: String)
}

extension DequeueReusableError {
    
    var description: String {
        switch self {
        case .cellWithIdentifier(let id):
            return "❌ Не удалось найти ячейку с идентификатором \(id)"
        case .viewWithIdentifier(let id):
            return "❌ Не удалось найти view с идентификатором \(id)"
        }
    }
}
