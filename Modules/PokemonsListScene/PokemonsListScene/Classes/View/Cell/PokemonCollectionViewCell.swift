import Common
import Extensions
import RxSwift
import RxCocoa
import SnapKit
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell, ClassName {

    // MARK: - Properties
    
    private var reuseBag = DisposeBag()

    // MARK: - Variables
    
    private var pokemonID: String = ""
    private var name: String = ""
    
    private var cellImageView: UIImageView!
    private var pokemonNameLabel: UILabel!
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        configureImageViewConstraints()
//        configureLabelConstratints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reuseBag = DisposeBag()
    }
    
    func render(with viewModel: PokemonCellViewModel.Output) {
        self.backgroundColor = .systemBlue
        configureImageViewConstraints()
        configureLabelConstratints()

        viewModel.image
            .drive(cellImageView.rx.image)
            .disposed(by: reuseBag)
        viewModel.name
            .drive(pokemonNameLabel.rx.text)
            .disposed(by: reuseBag)
    }
}

// MARK: - Configuration

private extension PokemonCollectionViewCell {

    func configureImageViewConstraints() {

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        cellImageView = imageView
        addSubview(cellImageView)

        cellImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
        }
    }
    
    func configureLabelConstratints() {

        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.tintColor = .black
        pokemonNameLabel = label
        addSubview(pokemonNameLabel)

        pokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom).offset(8).priority(1000)
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
