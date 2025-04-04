//
//  EventDetailsView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI
import PhotosUI

struct EventDetailsView: View {
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    var currentEvent: Event
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                if let imageData = currentEvent.backgroundImage,
                   let image = ImageUtils.decodeBase64ToImage(base64String: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 270)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 270)
                        .foregroundStyle(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading) {
                        Text(currentEvent.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text(currentEvent.formattedDateRange)
                        
                        Text(currentEvent.location)
                    }
                    
                    Text(currentEvent.description)
                    
                    Divider()
                        .frame(height: 4)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        if currentEvent.hostAttendees.isEmpty {
                            Text("No hosts yet.")
                        } else {
                            Text(currentEvent.hostAttendees.count == 1 ? "Host" : "Hosts")
                                .fontWeight(.semibold)
                            
                            ForEach(currentEvent.hostAttendees) { attendee in
                                AttendeeCardView(attendee: attendee, eventID: currentEvent.id)
                            }
                        }
                        
                        if currentEvent.attendees.isEmpty {
                            Text("No attendees yet.")
                        } else {
                            Text("Attendees")
                            
                            ForEach(currentEvent.regularAttendees) { attendee in
                                AttendeeCardView(attendee: attendee, eventID: currentEvent.id)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle(currentEvent.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: EditEventView(currentEvent: currentEvent)) {
                        Image(systemName: "square.and.pencil")
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
    EventDetailsView(currentEvent: Event(id: UUID(), name: "My Event", startDate: Date(), location: "Location", description: "Description"))
}
