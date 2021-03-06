//
//  DateSerializerDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-29.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public class DateSerializerDefault: NSObject, DateSerializer {
    
    
    // MARK: Public methods
    
    public func deserialize(_ string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = getDateFormat(for: string)
        return dateFormatter.date(from: string)
    }
    
    public func serialize(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = getDateFormat(for: ".")
        return dateFormatter.string(from: date)
    }
}



// MARK: Private methods

fileprivate extension DateSerializerDefault {
    
    func getDateFormat(for string: String) -> String {
        let dateFormatWithSeconds = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatWithSecondFragments = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        let hasFragments = string.range(of: ".") != nil
        return hasFragments ? dateFormatWithSecondFragments : dateFormatWithSeconds
    }
}
