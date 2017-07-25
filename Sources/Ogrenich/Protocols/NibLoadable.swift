//
//  NibLoadable.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {
    
    static var nibName: String { get }
    
}

public extension NibLoadable where Self: NSCoding {
    
    public static var nibName: String {
        return String(describing: self)
    }
    
}
