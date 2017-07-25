//
//  UIButton+Rx.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 30/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
#if !COCOAPODS
    import Ogrenich
#endif

public extension Reactive where Base: UIButton {
    
    /// Bindable sink for `imageEdgeInsets` property.
    public var imageEdgeInsets: UIBindingObserver<Base, UIEdgeInsets> {
        return UIBindingObserver(UIElement: self.base) { button, imageEdgeInsets in
            button.imageEdgeInsets = imageEdgeInsets
        }
    }
    
    /// Bindable sink for `titleEdgeInsets` property.
    public var titleEdgeInsets: UIBindingObserver<Base, UIEdgeInsets> {
        return UIBindingObserver(UIElement: self.base) { button, titleEdgeInsets in
            button.titleEdgeInsets = titleEdgeInsets
        }
    }
    
}
