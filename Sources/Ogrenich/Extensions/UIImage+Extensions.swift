//
//  UIImage+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 30/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UIImage {
    
    convenience public init?(color: UIColor,
                             size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
    
}

public extension UIImage {
    
    public func mask(with color: UIColor) -> UIImage? {
        let maskLayer = CALayer()
        
        maskLayer.bounds = CGRect(x: 0,
                                  y: 0,
                                  width: size.width,
                                  height: size.height)
        
        maskLayer.backgroundColor = color.cgColor
        maskLayer.doMask(by: self)
        return maskLayer.toImage()
    }
    
}
