//
//  UINavigationBar+Rx.swift
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

public extension Reactive where Base: UINavigationBar {
    
    /// Bindable sink for `setBackgroundColor(_:)` UINavigationBar's method.
    public var backgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: self.base) { navigationBar, backgroundColor in
            navigationBar.setBackgroundColor(backgroundColor)
        }
    }
    
    /// Bindable sink for `setBackgroundColor(_:for:)` UINavigationBar's method.
    public func setBackgroundColor(for barMetrics: UIBarMetrics = .default) -> UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: self.base) { navigationBar, backgroundColor in
            navigationBar.setBackgroundColor(backgroundColor, for: barMetrics)
        }
    }
    
}
