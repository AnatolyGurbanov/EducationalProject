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

    private var collectionView: UICollectionView!
    private var activityIndicator: UIActivityIndicatorView!
    
    private lazy var dataSource = makeCollectionViewDataSource()
    
    // MARK: - Initialize

    required init(dependencies: Dependencies) {
        self.viewModel = dependencies.viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureCollectionView()
        configureActivityIndicator()
        setupCollectionView(collectionView, delegate: dataSource, bag: disposeBag)
        setupOutput()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            .subscribe(onNext: { [weak self] item in self?.render(props: item) })
            .disposed(by: disposeBag)
    }
}

// MARK: - Configuration

private extension PokemonsListViewController {
    
    func configureActivityIndicator() {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemRed
        indicator.hidesWhenStopped = true
        activityIndicator = indicator
        self.view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func configureCollectionView() {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 24.0, bottom: 10.0, right: 24.0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height / 3.8)
        layout.minimumLineSpacing = 16.0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView = collectionView
            
        self.view.addSubview(self.collectionView)
            
        self.collectionView.backgroundColor = .clear
        self.collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(44.0)
            make.bottom.equalToSuperview().inset(16.0)
            make.trailing.equalToSuperview().inset(4.0)
            make.leading.equalToSuperview().inset(4.0)
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

    func makeCollectionViewDataSource() -> RxCollectionSectionWrapper<GenericSection<PokemonCellViewModel>> {
        let dataSource = RxCollectionSectionWrapper<GenericSection<PokemonCellViewModel>>(
            configureCell: { _, collectionView, indexPath, item -> UICollectionViewCell in
                let cell = collectionView.dequeueReusableCell(ofType: PokemonCollectionViewCell.self, at: indexPath)
                item.transform(.init()) { output in
                    cell.render(with: output)
                }
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
        case pokemon([GenericSection<PokemonCellViewModel>])
    }
    
    // MARK: Render
    
    func render(props: Props) {
        self.props = props

        switch props {
        case .pokemon(let pokemonsProps):
            Observable.just(pokemonsProps)
                .bind(to: collectionView.rx.items(dataSource: dataSource))
                .disposed(by: disposeBag)
        case .none:
            break
            
        }
        
        activityIndicator.stopAnimating()
    }
}

// MARK: - DI

extension PokemonsListViewController {
    public struct Dependencies {
        let viewModel: PokemonsListViewModel!
    }
}
