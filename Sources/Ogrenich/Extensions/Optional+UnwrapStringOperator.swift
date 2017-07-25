//
//  Optional+UnwrapStringOperator.swift
//  Scal.io Core Framework
//
//  Created by Zach Gray on 06/02/2017.
//  Copyright © 2017 Scal.io, LLC. All rights reserved.
//

import Foundation

postfix operator ~?

public postfix func ~?<X>(x: X?) -> String {
    return x.unwrappedString() ?? ""
}

fileprivate protocol _Optional {
    
    func unwrappedString() -> String?
    
}

extension Optional: _Optional {
    
    fileprivate func unwrappedString() -> String? {
        switch self {
        case .some(let wrapped as _Optional):
            return wrapped.unwrappedString()
        case .some(let wrapped):
            return String(describing: wrapped)
        case .none:
            return nil
        }
    }
    
}
