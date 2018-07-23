import UIKit

@IBDesignable
class UIRoundedView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            applyRadius(cornerRadius)
        }
    }
    
}
