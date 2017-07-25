//
//  UITextField+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

@IBDesignable
public extension UITextField {
    
    @IBInspectable
    public var placeholderTextColor: UIColor? {
        get {
            return value(forKeyPath: "_placeholderLabel.textColor") as? UIColor
        }
        
        set {
            setValue(newValue, forKeyPath: "_placeholderLabel.textColor")
        }
    }
    
}
