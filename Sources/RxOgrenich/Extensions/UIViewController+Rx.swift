//
//  UIViewController+Rx.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 25/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
#if !COCOAPODS
    import Ogrenich
#endif

public extension Reactive where Base: UIViewController {
    
    /// Bindable sink for `setBackgroundColor(_:)` UINavigationBar's method.
    public var navigationBarBackgroundColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: self.base) { viewController, backgroundColor in
            guard let navigationBar = viewController.navigationController?.navigationBar else {
                return
            }
            
            navigationBar.setBackgroundColor(backgroundColor)
        }
    }
    
    /// Bindable sink for `setBackgroundColor(_:for:)` UINavigationBar's method.
    public func navigationBarBackgroundColor(for barMetrics: UIBarMetrics = .default) -> UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: self.base) { viewController, backgroundColor in
            guard let navigationBar = viewController.navigationController?.navigationBar else {
                return
            }
            
            navigationBar.setBackgroundColor(backgroundColor, for: barMetrics)
        }
    }
    
}

public extension Reactive where Base: UIViewController {
    
    /// Convert any `Selector` to `ControlEvent<Void>`.
    public func controlEvent(for selector: Selector) -> ControlEvent<Void> {
        return ControlEvent(events: sentMessage(selector).map { _ in })
    }
    
    /// Reactive wrapper for `viewDidLoad` control event.
    public var viewDidLoad: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewDidLoad))
    }
    
    /// Reactive wrapper for `viewWillAppear` control event.
    public var viewWillAppear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewWillAppear))
    }
    
    /// Reactive wrapper for `viewDidAppear` control event.
    public var viewDidAppear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewDidAppear))
    }
    
    /// Reactive wrapper for `viewWillDisappear` control event.
    public var viewWillDisappear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewWillDisappear))
    }
    
    /// Reactive wrapper for `viewDidDisappear` control event.
    public var viewDidDisappear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewDidDisappear))
    }
    
}

public extension Reactive where Base: UIViewController {
    
    /// Bindable sink for `endEditing()` method.
    public var endEditing: UIBindingObserver<Base, Void> {
        return UIBindingObserver(UIElement: self.base) { viewController, _ in
            viewController.endEditing()
        }
    }
    
    /// Bindable sink for `close()` method.
    public var close: UIBindingObserver<Base, Void> {
        return UIBindingObserver(UIElement: self.base) { viewController, _ in
            viewController.close()
        }
    }
    
    /// Bindable sink for `close(animated:)` method.
    public func close(animated: Bool = true) -> UIBindingObserver<Base, Void> {
        return UIBindingObserver(UIElement: self.base) { viewController, _ in
            viewController.close(animated: animated)
        }
    }
    
    /// Bindable sink for `pop()` method.
    public var pop: UIBindingObserver<Base, Void> {
        return UIBindingObserver(UIElement: self.base) { viewController, _ in
            viewController.pop()
        }
    }
    
    /// Bindable sink for `pop(animated:)` method.
    public func pop(animated: Bool = true) -> UIBindingObserver<Base, Void> {
        return UIBindingObserver(UIElement: self.base) { viewController, _ in
            viewController.pop(animated: animated)
        }
    }
    
}
