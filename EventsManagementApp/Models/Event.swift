//
//  Event.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

struct Event: Identifiable {
    let id: UUID 
    var name: String
    var startDate: Date
    var endDate: Date?
    var location: String
    var description: String
    var attendees: [Attendee] = []
    
    var backgroundImage: String? = nil
    var isAllDay: Bool = true
    
    // COMPUTED PROPERTIES
    var hostAttendees: [Attendee] {
        attendees.filter { $0.isHost }
    }
    
    var regularAttendees: [Attendee] {
        attendees.filter { !$0.isHost }
    }
   
    var formattedDateRange: String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        if isAllDay {
            // For all-day events: only dates, no time.
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            
            if let endDate = endDate, calendar.isDate(startDate, inSameDayAs: endDate) {
                return dateFormatter.string(from: startDate)
            } else if let endDate = endDate {
                return "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
            } else {
                return dateFormatter.string(from: startDate)
            }
        } else {
            // For non-all-day events: show date and time.
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
            
            if let endDate = endDate {
                if calendar.isDate(startDate, inSameDayAs: endDate) {
                    // Same day: check if times differ
                    if calendar.compare(startDate, to: endDate, toGranularity: .minute) == .orderedSame {
                        // Times are the same: show one date with one time
                        return "\(dateFormatter.string(from: startDate)) \(timeFormatter.string(from: startDate))"
                    } else {
                        // Times are different: show the date once, then time range
                        return "\(dateFormatter.string(from: startDate)) \(timeFormatter.string(from: startDate)) - \(timeFormatter.string(from: endDate))"
                    }
                } else {
                    // Different days: show full date and time for both
                    return "\(dateFormatter.string(from: startDate)) \(timeFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate)) \(timeFormatter.string(from: endDate))"
                }
            } else {
                return "\(dateFormatter.string(from: startDate)) \(timeFormatter.string(from: startDate))"
            }
        }
    }
}
