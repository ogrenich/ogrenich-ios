//
//  UITableView+Rx.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 21/07/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
#if !COCOAPODS
    import Ogrenich
#endif

public extension RxSwift.Reactive where Base: UITableView {
    
    /// Bindable sink for `reloadData()` UITableView's method.
    public var reloadData: UIBindingObserver<Base, Void> {
        return UIBindingObserver(UIElement: self.base) { tableView, _ in
            tableView.reloadData()
        }
    }
    
}
