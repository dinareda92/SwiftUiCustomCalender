//
//  CalenderControler.swift
//  customeCalender
//
//  Created by Dina Reda on 6/9/20.
//  Copyright © 2020 Dina Reda. All rights reserved.
//

import Foundation
import UIKit
struct dayItem:Identifiable {
    var id:Int
    var dayNumber:Int
    var dayName:String
    var month:String
    var year:Int
}

class CalenderController:UIResponder{
   
    
       func generateDatesArrayBetweenTwoDates(startDate: Date, endDate: Date) -> [Date] {
           var datesArray: [Date] = [Date]()
           var startDate = startDate
           let calendar = Calendar.current
           while startDate <= endDate {
               let tempDate = dateFormatter().string(from: startDate)
               datesArray.append(dateFormatter().date(from: tempDate) ?? Date())
               startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
           }
           return datesArray
       }
       func dateFormatter() -> DateFormatter {
           let formatter = DateFormatter()
           formatter.dateFormat = "MM/dd/yyyy"
           return formatter
       }
       func getDates(startDate: Date, monthsAdded:Int)-> [dayItem]{
      var listOfDays = [dayItem]()
           let currentDate = startDate
           var dateComponent = DateComponents()
           dateComponent.month = monthsAdded
           let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) as! Date

           let datesArray = generateDatesArrayBetweenTwoDates(startDate: currentDate, endDate: futureDate)
        for (index,date) in datesArray.enumerated() {
               let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.day,.weekday,.month,.year], from: date)
            let dayname = dateFormatter().standaloneWeekdaySymbols[components.weekday! - 1]
                  // .standaloneWeekdaySymbols[components.day as! Int % 7]
               let day =  components.day as! Int
            let month = dateFormatter().standaloneMonthSymbols[components.month! - 1]
            let year = components.year!
               print("day \(dayname),\(day)")
            
            listOfDays.append(dayItem(id:index, dayNumber: day, dayName: dayname,month: month,year: year))
           }
        return listOfDays
       }
}
