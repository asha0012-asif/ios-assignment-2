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
            if event.attendees.isEmpty {
                Text("No attendees yet.")
            } else {
                List {
                    ForEach(event.attendees) { attendee in
                        AttendeeCardView(attendee: attendee)
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
