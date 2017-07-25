//
//  RxKeyboard.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 24/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/**
 RxKeyboard
 
 Handle `.UIKeyboardWillChangeFrame` and `.UIKeyboardWillHide` notifications
 and determine `visibleHeight` and `isVisible` properties of keyboard.
 
 Initialize subscription in your AppDelegate with:
 
 ```
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
    /// Set up RxKeyboard:
    RxKeyboard.instance.bindUIKeyboardNotifications()
 
    return true
 }
 ```
 */

public class RxKeyboard {
    
    public static let instance = RxKeyboard()
    
    fileprivate let bag = DisposeBag()
    
    public let visibleHeight = Variable<CGFloat>(0)
    public let isVisible = Variable<Bool>(false)
    
    init() {
        bindSelf()
    }
    
}

private extension RxKeyboard {
    
    func bindSelf() {
        visibleHeight.asDriver()
            .map { $0 != 0 }
            .drive(isVisible)
            .disposed(by: bag)
    }
    
}

public extension RxKeyboard {
    
    public func bindUIKeyboardNotifications() {
        NotificationCenter.default.rx.notification(.UIKeyboardWillChangeFrame)
            .map { notification -> CGFloat in
                guard
                    let userInfo = notification.userInfo,
                    let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue
                    else {
                        return 0
                }
                
                return keyboardFrame.cgRectValue.size.height
            }
            .bind(to: visibleHeight)
            .disposed(by: bag)
        
        NotificationCenter.default.rx.notification(.UIKeyboardWillHide)
            .map { _ in 0 }
            .bind(to: visibleHeight)
            .disposed(by: bag)
    }
    
}
