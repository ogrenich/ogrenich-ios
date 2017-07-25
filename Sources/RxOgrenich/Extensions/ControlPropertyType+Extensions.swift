//
//  ControlPropertyType+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
#if !COCOAPODS
    import Ogrenich
#endif

public extension RxCocoa.ControlPropertyType {
    
    /// Bidirectional binding with another ControlProperty.
    public func twoWayBind<C: RxCocoa.ControlPropertyType>(with property: C) -> RxSwift.Disposable where C.E == E {
        let bindSelf = self.bind(to: property)
        let bindProperty = property.bind(to: self)
        return RxSwift.CompositeDisposable(bindSelf, bindProperty)
    }
    
}
