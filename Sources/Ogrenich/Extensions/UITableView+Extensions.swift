//
//  UITableView+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 02/07/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UITableView {
    
    @discardableResult
    public func register<T: UITableViewCell>(_: T.Type) -> UITableView where T: Reusable, T: NibLoadable {
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
        return self
    }
    
    public func dequeueReusableCell<T: UITableViewCell>() -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
}
