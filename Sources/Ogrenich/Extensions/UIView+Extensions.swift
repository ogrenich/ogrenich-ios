//
//  UIView+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIView {
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor {
        get {
            if let borderColor = layer.borderColor {
                return UIColor(cgColor: borderColor)
            } else {
                return UIColor.clear
            }
        }
        
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
}

public extension UIView {
    
    public class func instantiateFromNib<T: UIView>() -> T where T: NibLoadable {
        guard let view = UINib(nibName: T.nibName, bundle: nil)
            .instantiate(withOwner: nil, options: nil).first as? T else {
                fatalError("Couldn't instantiate view with identifier \(T.nibName)")
        }
        
        return view
    }
    
}

public extension UIView {
    
    public enum Edge: Int, Iteratable {
        case top = 1000, left, bottom, right
    }
    
    public func addLine(to edge: Edge,
                        insets: UIEdgeInsets = .zero,
                        color: UIColor,
                        thickness: CGFloat = 0.5) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.tag = edge.rawValue
        lineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lineView)
        
        let topConstraint = NSLayoutConstraint(
            item: lineView,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1,
            constant: insets.top
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: lineView,
            attribute: .left,
            relatedBy: .equal,
            toItem: self,
            attribute: .left,
            multiplier: 1,
            constant: insets.left
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: lineView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1,
            constant: -insets.bottom
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: lineView,
            attribute: .right,
            relatedBy: .equal,
            toItem: self,
            attribute: .right,
            multiplier: 1,
            constant: -insets.right
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: lineView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: thickness
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: lineView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: thickness
        )
        
        switch edge {
        case .top:
            NSLayoutConstraint.activate(
                [
                    topConstraint,
                    leftConstraint,
                    rightConstraint,
                    heightConstraint
                ]
            )
        case .left:
            NSLayoutConstraint.activate(
                [
                    topConstraint,
                    leftConstraint,
                    bottomConstraint,
                    widthConstraint
                ]
            )
        case .bottom:
            NSLayoutConstraint.activate(
                [
                    leftConstraint,
                    bottomConstraint,
                    rightConstraint,
                    heightConstraint
                ]
            )
        case .right:
            NSLayoutConstraint.activate(
                [
                    topConstraint,
                    rightConstraint,
                    bottomConstraint,
                    widthConstraint
                ]
            )
        }
    }
    
    /**
     Removes all lines (subviews added with `addLine(to:insets:color:thickness:)` 
     method) of first level depth.
     */
    func removeLines() {
        let lineTags = Edge.cases().map { $0.rawValue }
        
        subviews.forEach {
            if lineTags.contains($0.tag) {
                $0.removeFromSuperview()
            }
        }
    }
    
}
