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
    
    // COMPUTED PROPERTIES
    var hostAttendees: [Attendee] {
        attendees.filter { $0.isHost }
    }
    
    var regularAttendees: [Attendee] {
        attendees.filter { !$0.isHost }
    }
}
