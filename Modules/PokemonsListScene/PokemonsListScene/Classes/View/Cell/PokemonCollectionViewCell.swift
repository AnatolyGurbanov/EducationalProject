import Common
import Extensions
import RxSwift
import RxCocoa
import SnapKit
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell, ClassName {

    // MARK: - Variables

    private var reuseBag = DisposeBag()

    private var pokemonID: String = ""
    private var name: String = ""
    
    private var cellImageView: UIImageView!
    private var pokemonNameLabel: UILabel!
    private var customView: UIView!
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configureImageViewConstraints()
        configureLabelConstratints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reuseBag = DisposeBag()
        let defaultImage = UIImage.image(name: "pokeball", for: Self.self)
        cellImageView.image = defaultImage
    }
    
    func render(with viewModel: PokemonCellViewModel.Output) {
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
    
    func configureCell() {
        let view = UIView()
        view.backgroundColor = .white
        customView = view
        addSubview(customView)
        
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }

        customView.layer.shadowColor = UIColor.gray.cgColor
        customView.layer.shadowRadius = 5.0
        customView.layer.shadowOpacity = 1.0
        customView.layer.shadowOffset = CGSize(width: 0, height: 0)
        customView.layer.masksToBounds = false
        
        customView.layer.cornerRadius = 5.0

    }

    func configureImageViewConstraints() {

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        cellImageView = imageView
        customView.addSubview(cellImageView)

        cellImageView.snp.makeConstraints { make in
            make.top.equalTo(customView).inset(8)
            make.trailing.equalTo(customView).inset(8).priority(1000)
            make.leading.equalTo(customView).inset(8).priority(1000)
            make.centerX.equalTo(customView)
        }
    }
    
    func configureLabelConstratints() {

        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .justified
        label.textColor = .black
        pokemonNameLabel = label
        customView.addSubview(pokemonNameLabel)

        pokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom).offset(8).priority(1000)
            make.bottom.equalTo(customView).inset(8).priority(1000)
            make.trailing.equalTo(cellImageView.snp.trailing).inset(8).priority(1000)
            make.leading.equalTo(customView).inset(8)
        }
    }
}
