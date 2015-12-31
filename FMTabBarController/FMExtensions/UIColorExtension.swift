import UIKit

extension UIColor {
    /**
     Initializes a UIColor object given by RGB values with opacaity 1.0.
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     Initializes a UIColor object given by an RGB hex value with opacaity 1.0.
     */
    convenience init(hexValue: Int) {
        self.init(red: (hexValue >> 16) & 0xff, green: (hexValue >> 8) & 0xff, blue: hexValue & 0xff)
    }
}
