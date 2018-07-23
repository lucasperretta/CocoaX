import UIKit

@IBDesignable
public class UIRoundedView: UIView {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet {
            applyRadius(cornerRadius)
        }
    }
    
}
