 import UIKit
 
 extension UIColor {
    
    /**
     The Color's Red RGB Value
     */
    var redValue: CGFloat{ return CIColor(color: self).red }
    /**
     The Color's Green RGB Value
     */
    var greenValue: CGFloat{ return CIColor(color: self).green }
    /**
     The Color's Blue RGB Value
     */
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    /**
     The Color's Alpha RGBA Value
     */
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
    /**
     The Color's Hex Value
     */
    var hexValue: String? {
        return toHex()
    }
    
    /**
     Creates a UIColor from **RGB values**
     */
    public static func fromRGBvalues (r: Int, g: Int, b: Int) -> UIColor {
        let rValue: CGFloat = CGFloat(r)
        let gValue: CGFloat = CGFloat(g)
        let bValue: CGFloat = CGFloat(b)
        return UIColor(red: CGFloat(rValue/255), green: CGFloat(gValue/255), blue: CGFloat(bValue/255), alpha: 1.0)
    }
    
    /**
     Creates a UIColor from a **Hex Value**
     */
    public static func fromHexString (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /**
     Returns a lighter version of the color
     */
    func lighter(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    /**
     Returns a darker version of the color
     */
    func darker(by percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    /**
     Returns an adjusted version of the color wich can be lighter or darker
     */
    func adjust(by percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if(self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        } else{
            return nil
        }
    }
    
    private func toHex(alpha: Bool = false) -> String? {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (r<0) {
            r=0
        }
        if (g<0) {
            g=0
        }
        if (b<0) {
            b=0
        }
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"%06x", rgb).uppercased()
        /*
         guard let components = cgColor.components, components.count >= 3 else {
         return nil
         }
         
         let r = Float(components[0])
         let g = Float(components[1])
         let b = Float(components[2])
         var a = Float(1.0)
         
         if components.count >= 4 {
         a = Float(components[3])
         }
         
         if alpha {
         return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
         } else {
         return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
         }
         */
    }
    
    /**
     Returns the corresponding text color having *this* as the background color
     */
    func getBlackOrWhiteTextColor(tolerance: Float = 140) -> UIColor {
        let temp_r = Float(self.redValue * 255) * 0.299
        let temp_g = Float(self.greenValue * 255) * 0.299
        let temp_b = Float(self.blueValue * 255) * 0.299
        
        if (temp_r + temp_g + temp_b) > tolerance {
            return UIColor.black
        } else {
            return UIColor.white
        }
    }
    
    /**
     Compares *this* to another color and returns if they are equal
     */
    func equals(color: UIColor) -> Bool {
        let r1 = self.redValue
        let r2 = self.redValue
        let g1 = self.greenValue
        let g2 = color.greenValue
        let b1 = color.blueValue
        let b2 = color.blueValue
        
        if (r1 == r2) && (g1 == g2) && (b1 == b2) {
            return true
        } else {
            return false
        }
    }
    
    /**
     Compares two colors and returns if they are equal
     */
    static func areColorsEqual(color1: UIColor, color2: UIColor) -> Bool {
        let r1 = color1.redValue
        let r2 = color1.redValue
        let g1 = color1.greenValue
        let g2 = color2.greenValue
        let b1 = color2.blueValue
        let b2 = color2.blueValue
        
        if (r1 == r2) && (g1 == g2) && (b1 == b2) {
            return true
        } else {
            return false
        }
    }
    
 }
