//
//  EventsViewModel.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    func createEvent(newEvent: Event) {
        events.append(newEvent)
    }
    
    func addAttendee(attendee: Attendee, to event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].attendees.append(attendee)
        }
    }
}
