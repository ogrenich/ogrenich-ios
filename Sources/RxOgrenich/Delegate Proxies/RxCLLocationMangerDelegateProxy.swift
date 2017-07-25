//
//  RxCLLocationManagerDelegateProxy.swift
//  RxCocoa
//
//  Created by Carlos García on 8/7/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import CoreLocation
import RxSwift
import RxCocoa
#if !COCOAPODS
    import Ogrenich
#endif

public class RxCLLocationManagerDelegateProxy: DelegateProxy, CLLocationManagerDelegate, DelegateProxyType {
    
    public class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let locationManager: CLLocationManager = object as! CLLocationManager
        return locationManager.delegate
    }
    
    public class func setCurrentDelegate(_ delegate: AnyObject?,
                                  toObject object: AnyObject) {
        let locationManager: CLLocationManager = object as! CLLocationManager
        locationManager.delegate = delegate as? CLLocationManagerDelegate
    }
    
}
