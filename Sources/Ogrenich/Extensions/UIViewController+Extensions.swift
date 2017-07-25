//
//  UIViewController+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    @objc
    public func endEditing() {
        view.endEditing(true)
    }
    
    @objc
    public func close(animated: Bool = true) {
        endEditing()
        dismiss(animated: animated)
    }
    
    @objc
    public func pop(animated: Bool = true) {
        endEditing()
        navigationController?.popViewController(animated: animated)
    }
    
}

public extension UIViewController {

    public func addEndEditingGestureRecognizer() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }

}
