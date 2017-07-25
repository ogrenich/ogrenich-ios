//
//  UIScrollView+Rx.swift
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

public extension RxSwift.Reactive where Base: UIScrollView {
    
    public var currentPage: RxSwift.Observable<Int> {
        return contentOffset
            .flatMap { [weak base] contentOffset -> RxSwift.Observable<Int> in
                guard let scrollView = base else {
                    return Observable.empty()
                }
                
                let visibleWidth: CGFloat = scrollView.frame.width - scrollView.contentInset.left - scrollView.contentInset.right
                let visibleOffset = contentOffset.x + scrollView.contentInset.left
                
                let currentPage = visibleWidth > 0
                    ? max(0, Int((visibleOffset / visibleWidth).rounded(.toNearestOrAwayFromZero)))
                    : 0
                
                return Observable.just(currentPage)
            }
            .distinctUntilChanged()
    }
    
    /// Bindable sink for `valueBasedOnOffset(from:to:for)` UIScrollView's method.
    public func valueBasedOnOffset(from start: CGFloat,
                                   to end: CGFloat,
                                   for axis: UIScrollView.Axis = .vertical) -> RxSwift.Observable<CGFloat> {
        return contentOffset
            .flatMap { [weak base] contentOffset -> RxSwift.Observable<CGFloat> in
                guard let scrollView = base else {
                    return RxSwift.Observable.empty()
                }
                
                return RxSwift.Observable.just(
                    scrollView.valueBasedOnOffset(from: start,
                                                  to: end,
                                                  for: axis)
                )
            }
    }
    
}
