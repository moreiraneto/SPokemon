import UIKit

class StylableView: UIView, Stylable {
    var stylesHandler: StylesHandler = StylesHandler()
    
    func setupColorsAndStyles() {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupColorsAndStyles()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupColorsAndStyles()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColorsAndStyles()
    }
}
