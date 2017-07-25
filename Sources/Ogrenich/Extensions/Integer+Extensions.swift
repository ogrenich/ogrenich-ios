//
//  Integer+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 21/07/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import Foundation

public extension Integer {
    
    public var isEven: Bool {
        return self % 2 == 0
    }
    
    public var isOdd: Bool {
        return self % 2 != 0
    }
    
}
