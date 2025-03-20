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
        ScrollView {
            VStack(spacing: 24) {
                if event.hostAttendees.isEmpty {
                    Text("No hosts yet.")
                        .fontWeight(.semibold)
                } else {
                    Text(event.hostAttendees.count == 1 ? "Host" : "Hosts")
                        .fontWeight(.semibold)
                    
                    ForEach(event.hostAttendees) { attendee in
                        EditableAttendeeCardView(attendee: attendee, eventID: event.id)
                    }
                }
                
                if event.regularAttendees.isEmpty {
                    Text("No attendees yet.")
                        .fontWeight(.semibold)
                } else {
                    Text("Attendees")
                        .fontWeight(.semibold)
                    
                    ForEach(event.regularAttendees) { attendee in
                        EditableAttendeeCardView(attendee: attendee, eventID: event.id)
                    }
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
            .padding(24)
        }
    }
}

#Preview {
    ManageAttendeesView(event: Event(id: UUID(), name: "My Event", startDate: Date(), location: "Location", description: "Description"))
}
