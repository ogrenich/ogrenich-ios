//
//  UIColor.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public convenience init(rgb: Int, alpha: CGFloat = 1) {
        let rgbValue = CGFloat(rgb) / 255
        
        self.init(
            red: rgbValue,
            green: rgbValue,
            blue: rgbValue,
            alpha: alpha
        )
    }
    
    public convenience init(red: Int, green: Int, blue: Int) {
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1
        )
    }
    
    public convenience init(hex: String, alpha: CGFloat = 1) {
        // Check for hash and remove the hash
        var cleanedHexString = hex
        
        if cleanedHexString.hasPrefix("#") {
            cleanedHexString = cleanedHexString.substring(
                from: cleanedHexString.index(
                    cleanedHexString.startIndex,
                    offsetBy: 1
                )
            )
        }
        
        // String -> UInt32
        var rgbValue = UInt32()
        Scanner(string: cleanedHexString).scanHexInt32(&rgbValue)
        
        // UInt32 -> R,G,B
        let a, r, g, b: UInt32
        
        switch cleanedHexString.length {
        case 3: // RGB (12-bit)
            (r, g, b) = (
                (rgbValue >> 8) * 17,
                (rgbValue >> 4 & 0xF) * 17,
                (rgbValue & 0xF) * 17
            )
            
            self.init(
                red: CGFloat(r) / 255,
                green: CGFloat(g) / 255,
                blue: CGFloat(b) / 255,
                alpha: alpha
            )
        case 6: // RGB (24-bit)
            (r, g, b) = (
                rgbValue >> 16,
                rgbValue >> 8 & 0xFF,
                rgbValue & 0xFF
            )
            
            self.init(
                red: CGFloat(r) / 255,
                green: CGFloat(g) / 255,
                blue: CGFloat(b) / 255,
                alpha: alpha
            )
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (
                rgbValue >> 24,
                rgbValue >> 16 & 0xFF,
                rgbValue >> 8 & 0xFF,
                rgbValue & 0xFF
            )
            
            self.init(
                red: CGFloat(r) / 255,
                green: CGFloat(g) / 255,
                blue: CGFloat(b) / 255,
                alpha: CGFloat(a) / 255
            )
        default:
            self.init(white: 1, alpha: alpha)
        }
    }
    
}
