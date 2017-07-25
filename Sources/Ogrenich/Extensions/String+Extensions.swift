//
//  String+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import Foundation

public extension String {
    
    public var length: Int {
        return characters.count
    }
    
    public var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined(separator: "")
    }
    
    public var url: URL? {
        return URL(string: self~?)
    }
    
    public var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    public var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}

public extension String {
    
    public var isNotEmpty: Bool {
        return length > 0
    }
    
    public var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    public var isValidPhone: Bool {
        return digits.length >= 11
    }
    
}

public extension String {
    
    public func capitalizingFirstLetter() -> String {
        let firstLetter = String(characters.prefix(1)).capitalized
        let otherLetters = String(characters.dropFirst())
        return firstLetter + otherLetters
    }
    
}
