//
//  UINavigationBar+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 30/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func setBackgroundColor(_ color: UIColor,
                                   for barMetrics: UIBarMetrics = .default) {
        setBackgroundImage(UIImage(color: color), for: barMetrics)
    }
    
}
