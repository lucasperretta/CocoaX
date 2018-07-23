import UIKit

@IBDesignable
public class UIFloatingActionButton: UIButton {
    
    override public init(frame: CGRect) {
        isMini = false
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        isMini = false
        super.init(coder: aDecoder)
    }
    
    @IBInspectable
    public var isMini: Bool {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        let size = !isMini ? 56 : 40
        return CGSize(width: size, height: size)
    }
    
    override public func draw(_ rect: CGRect) {
        invalidateIntrinsicContentSize()
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = frame.height / 2
        applyShadow(color: UIColor.black, opacity:0.25, radius: 5, offset: CGSize(width: 0, height: 10))
    }
 
}
