//
//  Reusable.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public protocol Reusable: class {
    
    static var reuseIdentifier: String { get }
    
}

public extension Reusable where Self: UIView {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
