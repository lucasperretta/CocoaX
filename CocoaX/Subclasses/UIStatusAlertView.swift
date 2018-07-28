import UIKit

@IBDesignable
public class UIStatusAlertView: UIView {
    
    override public init(frame: CGRect) {
        
        alertColor = UIColor.black
        colorAlpha = 0.55
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        alertColor = UIColor.black
        colorAlpha = 0.6
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    public var alertColor: UIColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    @IBInspectable
    public var colorAlpha: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func draw(_ rect: CGRect) {
        self.alpha = 0
        applyGradient(firstColor: alertColor.withAlphaComponent(colorAlpha), secondColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), orientation: .vertical)
    }
    
    public func showStatusAlert(fadeInAnimationDuration: TimeInterval = 0.5, delay: TimeInterval = 1.5, fadeOutAnimationDuration: TimeInterval = 0.5) {
        UIView.animate(withDuration: fadeInAnimationDuration, animations: {
            self.alpha = 1
        }, completion: { (true) in
            UIView.animate(withDuration: fadeOutAnimationDuration, delay: delay, animations: {
                self.alpha = 0
            })
        })
        
    }
}
