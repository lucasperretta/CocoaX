import UIKit

public extension UIView {
    
    //Enums
    /**
     Defines the possible **Default Shadow** configurations
     */
    public enum DefaultShadow {
        case ultraThin
        case thin
        case normal
        case thick
        case ultraThick
    }
    
    /**
     Defines the possible **Gradient Orientation** configurations
     */
    public enum GradientOrientation {
        case horizontal
        case vertical
        case corner1
        case corner2
    }
    
    //Methods
    
    /**
     Adds the default shadow behavior.
     When the user presses the button it cuts it's shadow in half with an animation; when the user releases the button it goes back to the original state with an animation
     */
    public func addShadowBehavior(button: UIButton) {
        button.addTarget(self, action: #selector(actionReleaseHandler), for: .touchUpInside)
        button.addTarget(self, action: #selector(actionReleaseHandler), for: .touchUpOutside)
        button.addTarget(self, action: #selector(actionPressHandler), for: .touchDown)
    }
    
    @objc private func actionPressHandler(_ sender: UIButton) {
        applyShadowRadiusWithAnimation(duration: 0.09, radius: layer.shadowRadius/2)
    }
    
    @objc private func actionReleaseHandler(_ sender: UIButton) {
        applyShadowRadiusWithAnimation(duration: 0.09, radius: layer.shadowRadius*2)
    }
    
    /**
     Applies a **radius** to the View
     */
    public func applyRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    /**
     Makes the View a **circle**
     */
    public func makeCircle() {
        layer.cornerRadius = frame.size.width/2
    }
    
    /**
     Applies a **Gradient** to the View
     */
    public func applyGradient(firstColor: UIColor, secondColor: UIColor, orientation: GradientOrientation) {
        let gradient: CAGradientLayer = CAGradientLayer()
        switch orientation {
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .vertical:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .corner1:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .corner2:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        }
        
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        //gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /**
     Applies a **Shadow** to the View
     */
    public func applyShadow(color: UIColor? = UIColor.black, opacity: Float? = 0.4, radius: CGFloat? = 6, offset: CGSize? = CGSize(width: 0, height: 0)) {
        layer.shadowColor = color?.cgColor
        if let shadowOffset = offset {
            layer.shadowOffset = shadowOffset
        }
        if let shadowRadius = radius {
            layer.shadowRadius = shadowRadius
        }
        if let shadowOpacity = opacity {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    /**
     Applies a **Default Shadow** value
     */
    public func applyDefaultShadow(style: DefaultShadow = .normal) {
        let radius: CGFloat
        switch style {
        case .ultraThin:
            radius = 2
        case .thin:
            radius = 4
        case .normal:
            radius = 6
        case .thick:
            radius = 8
        case .ultraThick:
            radius = 10
        }
        applyShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), opacity: 0.45, radius: radius, offset: CGSize(width: 0, height: 0))
    }
    
    /**
     Applies a **radius** to the View with an animation
     */
    public func applyRadiusWithAnimation(duration: CFTimeInterval, radius: CGFloat) {
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = layer.cornerRadius
        animation.toValue = radius
        animation.duration = duration
        layer.add(animation, forKey: "cornerRadius")
        layer.cornerRadius = radius
    }
    
    /**
     Applies a **shadow radius** to the View with an animation
     */
    public func applyShadowRadiusWithAnimation(duration: CFTimeInterval, radius: CGFloat) {
        let animation = CABasicAnimation(keyPath: "shadowRadius")
        animation.fromValue = layer.shadowRadius
        animation.toValue = radius
        animation.duration = duration
        layer.add(animation, forKey: animation.keyPath)
        layer.shadowRadius = radius
        
    }
    
}
