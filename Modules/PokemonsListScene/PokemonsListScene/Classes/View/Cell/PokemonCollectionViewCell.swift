import Common
import Extensions
import RxSwift
import RxCocoa
import SnapKit
import UIKit

final class PokemonCollectionViewCell: UICollectionViewCell, ClassName {
    // MARK: Props
    struct Props: Equatable {
        let id: String
        let image: URLString
    }

    // MARK: - Variables
    
    private var pokemonID: String = ""
    private var cellImageView: UIImageView {
        var image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureImageViewConstraints()
    }
    
    func render(props: Props) {
        cellImageView.image = props.image
        pokemonID = props.id
    }
}

// MARK: - Configuration

private extension PokemonCollectionViewCell {

    func configureImageViewConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
