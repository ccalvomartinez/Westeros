//
//  FoundationExtensions.swift
//  Westeros
//
//  Created by Administrador on 30/7/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import Foundation

extension Date{
   static func dateFromYearMonthDay(year: Int, month: Int, day: Int) -> Date{
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = 0
        dateComponents.minute = 0
        
        // Create date from components
        let userCalendar = Calendar.current // user calendar
        return userCalendar.date(from: dateComponents)!
        
    }
}

extension Date{

    func description(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = timeStyle
        formatter.dateStyle = dateStyle
        
        // get the date time String from the date object
        return formatter.string(from: self)
    }
}
