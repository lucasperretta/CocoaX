import UIKit

@IBDesignable
class UIStatusAlert: UIView {
    
    override init(frame: CGRect) {
        alertColor = UIColor.black
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        alertColor = UIColor.black
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    var alertColor: UIColor
    
    override func draw(_ rect: CGRect) {
        applyGradient(firstColor: alertColor, secondColor: UIColor.clear, orientation: .vertical)
    }
    
    
}
