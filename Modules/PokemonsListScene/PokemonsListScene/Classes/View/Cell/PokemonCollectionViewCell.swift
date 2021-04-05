import Common
import Extensions
import RxSwift
import RxCocoa
import SnapKit
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell, ClassName {

    // MARK: - Properties
    
    private var reuseBag = DisposeBag()
    private let viewModel: PokemonCellViewModel!

    // MARK: - Variables
    
    private var pokemonID: String = ""
    private var name: String = ""
    private var cellImageView: UIImageView {
        var image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }
    
    private var pokemonNameLabel: UILabel {
        var label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.tintColor = .black
        return label
    }
    
    // MARK: - Initialize

    init(dependencies: Dependencies) {
        self.viewModel = dependencies.viewModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reuseBag = DisposeBag()
        configureImageViewConstraints()
    }
    
    func render(with viewModel: PokemonCellViewModel) {
//        viewModel.image
//            .drive(cellImageView.rx.image)
//            .disposed(by: reuseBag)
//        viewModel.name
//            .drive(pokemonNameLabel.rx.text)
//            .disposed(by: reuseBag)
    }
}

// MARK: - Configuration

private extension PokemonCollectionViewCell {

    func configureImageViewConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
        }
    }
    
    func configureLabelConstratints() {
        pokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView).offset(8).priority(1000)
            make.bottom.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
        }
    }
}

// MARK: - DI

extension PokemonCollectionViewCell {
    public struct Dependencies {
        let viewModel: PokemonCellViewModel!
    }
}
