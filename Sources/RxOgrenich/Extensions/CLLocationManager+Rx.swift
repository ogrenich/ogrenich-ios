//
//  CLLocationManager+Rx.swift
//  RxCocoa
//
//  Created by Carlos García on 8/7/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//
//  *** Updated to work with latest RxCocoa ***
//

import CoreLocation
import RxSwift
import RxCocoa
#if !COCOAPODS
    import Ogrenich
#endif

public extension RxSwift.Reactive where Base: CLLocationManager {
    
    /**
     Reactive wrapper for `delegate`.
     For more information take a look at `DelegateProxyType` protocol documentation.
     */
    public var delegate: DelegateProxy {
        return RxCLLocationManagerDelegateProxy.proxyForObject(base)
    }
    
    
    // MARK: Responding to Location Events
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didUpdateLocations: RxSwift.Observable<[CLLocation]> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didUpdateLocations:)))
            .map {
                return try castOrThrow([CLLocation].self, $0[1])
            }
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didFailWithError: RxSwift.Observable<NSError> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didFailWithError:)))
            .map {
                return try castOrThrow(NSError.self, $0[1])
            }
    }
    
    
    #if os(iOS) || os(OSX)
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didFinishDeferredUpdatesWithError: RxSwift.Observable<NSError?> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didFinishDeferredUpdatesWithError:)))
            .map {
                return try castOptionalOrThrow(NSError.self, $0[1])
            }
    }
    
    #endif
    
    
    #if os(iOS)
    
    // MARK: Pausing Location Updates
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didPauseLocationUpdates: RxSwift.Observable<Void> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManagerDidPauseLocationUpdates(_:)))
            .map { _ in
                return ()
            }
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didResumeLocationUpdates: RxSwift.Observable<Void> {
        return delegate
            .sentMessage( #selector(CLLocationManagerDelegate.locationManagerDidResumeLocationUpdates(_:)))
            .map { _ in
                return ()
            }
    }
    
    
    // MARK: Responding to Heading Events
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didUpdateHeading: RxSwift.Observable<CLHeading> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didUpdateHeading:)))
            .map {
                return try castOrThrow(CLHeading.self, $0[1])
            }
    }
    
    
    // MARK: Responding to Region Events
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didEnterRegion: RxSwift.Observable<CLRegion> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didEnterRegion:)))
            .map {
                return try castOrThrow(CLRegion.self, $0[1])
            }
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didExitRegion: RxSwift.Observable<CLRegion> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didExitRegion:)))
            .map {
                return try castOrThrow(CLRegion.self, $0[1])
            }
    }
    
    #endif
    
    
    #if os(iOS) || os(OSX)
    
    /**
     Reactive wrapper for `delegate` message.
     */
    @available(OSX 10.10, *)
    public var didDetermineStateForRegion: RxSwift.Observable<(state: CLRegionState, region: CLRegion)> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didDetermineState:for:)))
            .map {
                let stateNumber = try castOrThrow(NSNumber.self, $0[1])
                let state = CLRegionState(rawValue: stateNumber.intValue) ?? CLRegionState.unknown
                let region = try castOrThrow(CLRegion.self, $0[2])
                return (state: state, region: region)
            }
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var monitoringDidFailForRegionWithError: RxSwift.Observable<(region: CLRegion?, error: NSError)> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:monitoringDidFailFor:withError:)))
            .map {
                let region = try castOptionalOrThrow(CLRegion.self, $0[1])
                let error = try castOrThrow(NSError.self, $0[2])
                return (region: region, error: error)
            }
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didStartMonitoringForRegion: RxSwift.Observable<CLRegion> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didStartMonitoringFor:)))
            .map {
                return try castOrThrow(CLRegion.self, $0[1])
            }
    }
    
    #endif
    
    
    #if os(iOS)
    
    // MARK: Responding to Ranging Events
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didRangeBeaconsInRegion: RxSwift.Observable<(beacons: [CLBeacon], region: CLBeaconRegion)> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didRangeBeacons:in:)))
            .map {
                let beacons = try castOrThrow([CLBeacon].self, $0[1])
                let region = try castOrThrow(CLBeaconRegion.self, $0[2])
                return (beacons: beacons, region: region)
            }
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var rangingBeaconsDidFailForRegionWithError: RxSwift.Observable<(region: CLBeaconRegion, error: NSError)> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:rangingBeaconsDidFailFor:withError:)))
            .map {
                let region = try castOrThrow(CLBeaconRegion.self, $0[1])
                let error = try castOrThrow(NSError.self, $0[2])
                return (region: region, error: error)
            }
    }
    
    
    // MARK: Responding to Visit Events
    
    /**
     Reactive wrapper for `delegate` message.
     */
    @available(iOS 8.0, *)
    public var didVisit: RxSwift.Observable<CLVisit> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didVisit:)))
            .map {
                return try castOrThrow(CLVisit.self, $0[1])
            }
    }
    
    #endif
    
    
    // MARK: Responding to Authorization Changes
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didChangeAuthorizationStatus: RxSwift.Observable<CLAuthorizationStatus> {
        return delegate
            .sentMessage(#selector(CLLocationManagerDelegate.locationManager(_:didChangeAuthorization:)))
            .map {
                let number = try castOrThrow(NSNumber.self, $0[1])
                return CLAuthorizationStatus(rawValue: Int32(number.intValue)) ?? .notDetermined
            }
    }
    
}

fileprivate func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    
    return returnValue
}

fileprivate func castOptionalOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T? {
    if NSNull().isEqual(object) {
        return nil
    }
    
    guard let returnValue = object as? T else {
        throw RxCocoaError.castingError(object: object, targetType: resultType)
    }
    
    return returnValue
}
