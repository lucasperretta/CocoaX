import UIKit

public protocol Theme {
    /**
     Represents the background color of your theme
     */
    var background: UIColor { get }
    /**
     Represents the normal or accent color of your theme
     */
    var accent: UIColor { get }
    /**
     Represents the color that will indicate interactivity or the tint color of your theme
     */
    var tint: UIColor { get }
    /**
     Represents the default text color of your theme
     */
    var text: UIColor { get }
}
