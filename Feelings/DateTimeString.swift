//
//  DateTimeString.swift
//  
//
//  Created by Cake on 9/8/18.
//

import UIKit

//  A model to acquire current date and current time as String type
//  Reusable
class DateTimeString: NSObject {
//  Get current date
    let currentDate = Date()
   // var daysToSubtract : Int = 0
//  Convert current date to a String.
//  formatter.dateFormat value can be customized at http://nsdateformatter.com
    func getCurrentDate(from: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YY"
        let str = formatter.string(from: Date())
        return str
    }
//  Convert current time to a String. timeStyle can be .long .medium .short
    func getCurrentTime(from: Date) -> String{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let str = formatter.string(from: Date())
        return str
    }
}
