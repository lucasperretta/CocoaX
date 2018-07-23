import UIKit

@IBDesignable
public class UIShadowView: UIView {
    
    @IBInspectable
    public var shadowColor: UIColor = UIColor.black {
        didSet {
            applyShadowFromValues()
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float = 0.4 {
        didSet {
            applyShadowFromValues()
        }
    }
    
    @IBInspectable
    public var shadowRadius: CGFloat = 6 {
        didSet {
            applyShadowFromValues()
        }
    }
    
    @IBInspectable
    public var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            applyShadowFromValues()
        }
    }
    
    private func applyShadowFromValues() {
        applyShadow(color: shadowColor, opacity: shadowOpacity, radius: shadowRadius, offset: shadowOffset)
    }

}
