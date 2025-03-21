//
//  EventsViewModel.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    func createEvent(_ newEvent: Event) {
        events.append(newEvent)
    }
    
    func updateEvent(with eventID: UUID, to updatedEvent: Event) {
        if let index = events.firstIndex(where: { $0.id == eventID }) {
            events[index] = updatedEvent
        }
    }
    
    func cancelEvent(with eventID: UUID) {
        events.removeAll(where: { $0.id == eventID })
    }
    
    func addAttendee(_ attendee: Attendee, to eventID: UUID) {
        if let index = events.firstIndex(where: { $0.id == eventID }) {
            events[index].attendees.append(attendee)
        }
    }
    
    func removeAttendee(_ attendee: Attendee, from eventID: UUID) {
        if let index = events.firstIndex(where: { $0.id == eventID }) {
            events[index].attendees.removeAll(where: {$0.id == attendee.id })
        }
    }
    
    func toggleAttendeeHostStatus(for attendee: Attendee, in eventID: UUID) {
        if let eventIndex = events.firstIndex(where: { $0.id == eventID }) {
            if let attendeeIndex = events[eventIndex].attendees.firstIndex(where: { $0.id == attendee.id }) {
                events[eventIndex].attendees[attendeeIndex].isHost.toggle()
            }
        }
    }
}
