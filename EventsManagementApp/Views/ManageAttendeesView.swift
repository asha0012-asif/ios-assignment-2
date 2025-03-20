//
//  ManageAttendeesView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct ManageAttendeesView: View {
    var event: Event
    
    var body: some View {
        VStack {
            
            if event.hostAttendees.isEmpty {
                Text("No hosts yet.")
            } else {
                Text(event.hostAttendees.count == 1 ? "Host" : "Hosts")
                    .fontWeight(.semibold)
                
                List {
                    ForEach(event.hostAttendees) { attendee in
                        EditableAttendeeCardView(attendee: attendee, eventID: event.id)
                    }
                }
                .listStyle(.plain)
            }
            
            if event.regularAttendees.isEmpty {
                Text("No attendees yet.")
            } else {
                Text("Attendees")
                    .fontWeight(.semibold)
                
                List {
                    ForEach(event.attendees) { attendee in
                        EditableAttendeeCardView(attendee: attendee, eventID: event.id)
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle(Text("Manage Attendees"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddAttendeeView(eventID: event.id)) {
                    Image(systemName: "plus.square")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    ManageAttendeesView(event: Event(id: UUID(), name: "My Event", startDate: Date(), location: "Location", description: "Description"))
}
