//
//  Event.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

struct Event: Identifiable {
    let id: UUID = UUID()
    var name: String
    var startDate: Date
    var endDate: Date?
    var location: String
    var description: String
    var attendees: [Attendee]
}
