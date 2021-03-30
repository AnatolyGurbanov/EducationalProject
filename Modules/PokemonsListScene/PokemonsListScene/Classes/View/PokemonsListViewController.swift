import Common
import Extensions
import Models
import RxCocoa
import RxDataSources
import RxSwift
import RxViewController
import SnapKit
import UIKit

final class PokemonsListViewController: UIViewController {
    // MARK: - Properties

    private let disposeBag = DisposeBag()
    private let viewModel: PokemonsListViewModel!
    
    // MARK: - Variables
    
    var props = Props.none

    private var collectionView: UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private lazy var dataSource = makeTableViewDataSource()
    
    // MARK: - Initialize

    init(dependencies: Dependencies) {
        self.viewModel = dependencies.viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupCollectionView(collectionView, delegate: dataSource, bag: disposeBag)
    }
    
    func setupOutput() {

        let appearTrigger = self.rx.viewDidAppear.asDriver().mapToVoid()
        let loadTrigger = Driver.merge(appearTrigger)
        
        let input = PokemonsListViewModel.Input(
            disposeBag: disposeBag,
            loadTrigger: loadTrigger
        )
        viewModel.transform(input) { [weak self] in self?.setupInput(input: $0) }
    }
    
    func setupInput(input: PokemonsListViewModel.Output) {
        input.props
            .subscribe(onNext: { [weak self] in self?.render(props: $0) })
            .disposed(by: disposeBag)
    }
}

// MARK: - Configuration

private extension PokemonsListViewController {
    
    func configureCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupCollectionView(
        _ collectionView: UICollectionView,
        delegate: UICollectionViewDelegate,
        bag: DisposeBag
    ) {
        collectionView.registerCellClass(PokemonCollectionViewCell.self)
        collectionView.rx.setDelegate(delegate).disposed(by: bag)

        collectionView.rx.itemSelected
            .subscribe(
                onNext: { indexPath in
                    collectionView.deselectItem(at: indexPath, animated: false)
                }
            )
            .disposed(by: bag)
    }

    func makeTableViewDataSource() -> RxCollectionSectionWrapper<GenericSection<PokemonCollectionViewCell.Props>> {
        let dataSource = RxCollectionSectionWrapper<GenericSection<PokemonCollectionViewCell.Props>>(
            configureCell: { _, collectionView, indexPath, item -> UICollectionViewCell in
                let cell = collectionView.dequeueReusableCell(ofType: PokemonCollectionViewCell.self, at: indexPath)
                cell.render(props: item)
                return cell
            }
        )
        return dataSource
    }
}

// MARK: - Props

extension PokemonsListViewController {
    enum Props: Equatable {
        case none
        case pokemons([GenericSection<PokemonCollectionViewCell.Props>])
    }
    
    // MARK: Render
    
    func render(props: Props) {
        self.props = props

        switch props {
        case .pokemons(let pokemonsProps):
            Observable.just(pokemonsProps)
                .bind(to: collectionView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)
        case .none:
            break
            
        }
    }
}

// MARK: - DI

extension PokemonsListViewController {
    public struct Dependencies {
        let viewModel: PokemonsListViewModel!
    }
}
