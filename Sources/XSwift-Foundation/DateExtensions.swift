//
//  DateExtensions.swift
//  
//
//  Created by Jorge Mattei on 8/26/22.
//

import Foundation

public extension Date {
    func string(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .none) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }

    var withoutTime : Date {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = calendar.component(.day, from: self)
        dateComponents.month = calendar.component(.month, from: self)
        dateComponents.year = calendar.component(.year, from: self)
        return dateComponents.date!
    }

    func next(_ component: Calendar.Component) -> Date {
        var components = DateComponents()
        components.setValue(1, for: component)
        let next = Calendar.current.date(byAdding: components, to: self)
        return next!
    }

    func previous(_ component: Calendar.Component) -> Date {
        var components = DateComponents()
        components.setValue(1, for: component)
        let previous = Calendar.current.date(byAdding: components, to: self)
        return previous!
    }
    
}
