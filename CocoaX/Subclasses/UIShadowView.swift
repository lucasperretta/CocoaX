import UIKit

@IBDesignable
public class UIGradientView: UIView {
    
    override public init(frame: CGRect) {
        self.firstColor = UIColor.white
        self.secondColor = UIColor.black
        self.orientation = 1
        
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.firstColor = UIColor.white
        self.secondColor = UIColor.black
        self.orientation = 1
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    public var firstColor: UIColor
    
    @IBInspectable
    public var secondColor: UIColor
    
    @IBInspectable
    public var orientation: Int
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        let orientation: UIView.GradientOrientation
        switch self.orientation {
        case 1:
            orientation = .vertical
        case 2:
            orientation = .horizontal
        case 3:
            orientation = .corner1
        case 4:
            orientation = .corner2
        default:
            orientation = .vertical
        }
        applyGradient(firstColor: firstColor, secondColor: secondColor, orientation: orientation)
    }
    
    
}
