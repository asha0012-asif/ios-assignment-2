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
                    
                    if currentEvent.endDate == currentEvent.startDate {
                        Text("\(currentEvent.startDate, style: .date)")
                    } else {
                        Text("\(currentEvent.startDate, style: .date) to \(currentEvent.endDate!, style: .date)")
                    }
                    
                    Text(currentEvent.location)
                }
                
                Text(currentEvent.description)
                
                Divider()
                    .frame(height: 4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Attending")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    if currentEvent.attendees.isEmpty {
                        Text("No attendees yet.")
                    } else {
                        List {
                            ForEach(currentEvent.attendees) { attendee in
                                AttendeeCardView(attendee: attendee)
                            }
                        }
                        .listStyle(.plain)
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

#Preview {
    EventDetailsView(currentEvent: Event(id: UUID(), name: "My Event", startDate: Date(), location: "Location", description: "Description"))
}
