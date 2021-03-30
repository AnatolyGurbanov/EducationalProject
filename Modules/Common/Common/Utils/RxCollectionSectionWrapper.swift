import UIKit
import RxSwift
import RxCocoa
import RxDataSources

public final class RxCollectionSectionWrapper<T>:
    RxCollectionViewSectionedReloadDataSource<T>,
    UICollectionViewDelegate
    where T: SectionModelType {
}
