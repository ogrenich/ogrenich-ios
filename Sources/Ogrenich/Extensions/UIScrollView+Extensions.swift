//
//  UIScrollView+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 30/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    public enum Axis {
        case horizontal, vertical
    }

}

public extension UIScrollView {
    
    public func valueBasedOnOffset(from start: CGFloat,
                                   to end: CGFloat,
                                   for axis: Axis = .vertical) -> CGFloat {
        let offset: CGFloat
        
        switch axis {
        case .vertical:
            offset = contentOffset.y
        case .horizontal:
            offset = contentOffset.x
        }
        
        let isDecreasing = start > end
        
        let value: CGFloat
        
        if isDecreasing {
            if offset > start {
                value = 0
            } else if offset < end {
                value = 1
            } else {
                value = 1 - (offset - end) / (start - end)
            }
        } else {
            if offset < start {
                value = 0
            } else if offset > end {
                value = 1
            } else {
                value = (offset - start) / (end - start)
            }
        }
        
        return value
    }
    
    public func maxContentOffset(for axis: Axis = .vertical) -> CGFloat {
        switch axis {
        case .vertical:
            let scrollableHeight = contentSize.height
                + contentInset.top
                + contentInset.bottom
            
            let isScrollingPossible = scrollableHeight > bounds.height
            
            return isScrollingPossible
                ? contentSize.height + contentInset.bottom - bounds.height
                : -contentInset.top
        case .horizontal:
            let scrollableWidth = contentSize.width
                + contentInset.left
                + contentInset.right
            
            let isScrollingPossible = scrollableWidth > bounds.width
            
            return isScrollingPossible
                ? contentSize.width + contentInset.right - bounds.width
                : -contentInset.left
        }
    }
    
}
