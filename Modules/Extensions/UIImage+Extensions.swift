import UIKit

extension UIImage {
    
    func image(name: String, for module: AnyClass) -> UIImage {

        let bundle = Bundle(for: module)
        guard let image = UIImage(named: name, in: bundle, compatibleWith: nil) else {
            return UIImage()
        }

        return image
    }
}
