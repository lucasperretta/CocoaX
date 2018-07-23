import UIKit

@IBDesignable
class UIShadowView: UIView {
    
    @IBInspectable
    var shadowColor: UIColor = UIColor.black {
        didSet {
            applyShadowFromValues()
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 0.4 {
        didSet {
            applyShadowFromValues()
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 6 {
        didSet {
            applyShadowFromValues()
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            applyShadowFromValues()
        }
    }
    
    private func applyShadowFromValues() {
        applyShadow(color: shadowColor, opacity: shadowOpacity, radius: shadowRadius, offset: shadowOffset)
    }

}
