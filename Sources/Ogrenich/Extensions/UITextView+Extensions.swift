//
//  UITextView+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/07/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UITextView {
    
    public func setAttributed(text: String?,
                              kerning: CGFloat = 0,
                              lineHeight: CGFloat = 0,
                              paragraphSpacing: CGFloat = 0) {
        guard
            let text = text,
            let textColor = textColor,
            let font = font
        else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        let lineHeightMultiple = lineHeight / font.lineHeight
        
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.alignment = textAlignment
        
        attributedString.addAttributes(
            [
                NSKernAttributeName: kerning,
                NSParagraphStyleAttributeName: paragraphStyle,
                NSForegroundColorAttributeName: textColor,
                NSFontAttributeName: font
            ],
            range: NSMakeRange(0, attributedString.length)
        )
        
        attributedText = attributedString
    }
    
}
