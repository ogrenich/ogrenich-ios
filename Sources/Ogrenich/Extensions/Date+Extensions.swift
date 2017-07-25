//
//  Date+Extensions.swift
//  Ogrenich iOS Framework
//
//  Created by Andrey Ogrenich on 13/06/2017.
//  Copyright © 2017 Andrey Ogrenich. All rights reserved.
//

import Foundation

public extension Date {
    
    public static func from(string: String,
                            with format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSX") -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
    
    public static func string(from date: Date?,
                              with format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSX",
                              context: Formatter.Context = .standalone) -> String? {
        guard let date = date else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format
        formatter.formattingContext = context
        return formatter.string(from: date)
    }
    
}
