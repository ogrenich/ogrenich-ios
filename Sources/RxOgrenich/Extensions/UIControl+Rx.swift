//
//  UIControl+Rx.swift
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

public extension RxSwift.Reactive where Base: UIControl {
    
    /// Reactive wrapper for `highlighted` property.
    public var isHighlighted: RxCocoa.ControlProperty<Bool> {
        return UIControl.rx.highlightedValue(
            self.base,
            getter: { control in
                control.isHighlighted
            }, setter: { control, value in
                control.isHighlighted = value
            }
        )
    }
    
}

public extension RxSwift.Reactive where Base: UIControl {

    public static func valuePublic<T, ControlType: UIControl>(_ control: ControlType,
                                   getter:  @escaping (ControlType) -> T,
                                   setter: @escaping (ControlType, T) -> ()) -> ControlProperty<T> {
        let values: RxSwift.Observable<T> = RxSwift.Observable.deferred { [weak control] in
            guard let existingSelf = control else {
                return Observable.empty()
            }
            
            return (existingSelf as UIControl).rx.controlEvent([.allEditingEvents, .valueChanged])
                .flatMap { _ in
                    return control.map { Observable.just(getter($0)) } ?? Observable.empty()
                }
                .startWith(getter(existingSelf))
        }
        
        return ControlProperty(values: values,
                               valueSink: UIBindingObserver(UIElement: control) { control, value in
            setter(control, value)
        })
    }
    
    public static func highlightedValue<ControlType: UIControl>(_ control: ControlType,
                                        getter:  @escaping (ControlType) -> Bool,
                                        setter: @escaping (ControlType, Bool) -> ()) -> ControlProperty<Bool> {
        let values: RxSwift.Observable<Bool> = Observable.deferred { [weak control] in
            guard let existingSelf = control else {
                return Observable.empty()
            }
            
            let highlightedEvent = (existingSelf as UIControl).rx.controlEvent([.touchDown, .touchDragInside])
                .flatMap { _ in
                    Observable.just(true)
                }
            
            let unHighlightedEvent = (existingSelf as UIControl).rx.controlEvent([.touchDragOutside, .touchDragExit, .touchUpInside, .touchUpOutside, .touchCancel])
                .flatMap { _ in
                     Observable.just(false)
                }
            
            return Observable.of(highlightedEvent, unHighlightedEvent)
                .merge()
                .startWith(getter(existingSelf))
                .distinctUntilChanged()
        }
        
        return ControlProperty(values: values,
                               valueSink: UIBindingObserver(UIElement: control) { control, value in
            setter(control, value)
        })
    }
    
}
