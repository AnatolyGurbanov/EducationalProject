import Common
import RxSwift
import RxCocoa
import RxDataSources

typealias ItemType = IdentifiableType & ViewModel & Equatable

extension SharedSequence
where SharingStrategy == DriverSharingStrategy, Element: Collection, Element.Element: ViewModel {
    
    public func wrappedInEmptySection() -> Driver<[EmptySection<Element.Element>]> {
        return flatMapLatest({ element in
            guard let element = element as? [Element.Element] else {
                return Driver.empty()
            }
            return Driver.just([EmptySection(items: element)])
        })
    }
}


extension SharedSequence
where SharingStrategy == DriverSharingStrategy, Element: Collection, Element.Element: SectionModelType {
    
    /// Temporarily fixes RxCocoa problem
    /// https://github.com/ReactiveX/RxSwift/pull/2076
    public func drive<DataSource>(_ tableView: UITableView,
                           _ dataSource: DataSource,
                           disposedBy bag: DisposeBag)
        where DataSource: RxTableViewDataSourceType & UITableViewDataSource, DataSource.Element == Element {
            DispatchQueue.main.async {
                self.drive(tableView.rx.items(dataSource: dataSource))
                    .disposed(by: bag)
            }
    }
}
