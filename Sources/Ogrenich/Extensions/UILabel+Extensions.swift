//
//  UILabel+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UILabel {
    
    public func setAttributed(text: String?,
                              kerning: CGFloat = 0,
                              lineHeight: CGFloat = 0,
                              paragraphSpacing: CGFloat = 0) {
        guard let text = text else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        let lineHeightMultiple = lineHeight / font.lineHeight
        
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = lineBreakMode
        
        attributedString.addAttributes(
            [
                NSKernAttributeName: kerning,
                NSParagraphStyleAttributeName: paragraphStyle
            ],
            range: NSMakeRange(0, attributedString.length)
        )
        
        attributedText = attributedString
    }
    
}
