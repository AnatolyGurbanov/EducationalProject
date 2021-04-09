import Foundation
import RxDataSources

public struct EmptySection<T: ViewModel>: SectionModelType {
    public typealias Item = T

    public var items: [T]

    public init(items: [Item]) {
        self.items = items
    }

    public init(original: EmptySection<T>, items: [Item]) {
        self = original
        self.items = items
    }
}
