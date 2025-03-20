//
//  AttendeeCardView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI
import PhotosUI

struct EditableAttendeeCardView: View {
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    var attendee: Attendee
    var eventID: UUID
    
    var body: some View {
        HStack {
            if let imageData = attendee.avatar,
               let image = ImageUtils.decodeBase64ToImage(base64String: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
                    .foregroundStyle(.gray)
                    .clipShape(.circle)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 64, height: 64)
                    .foregroundStyle(.gray)
                    .clipShape(.circle)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(attendee.fullName)
                    .font(.headline)
                Text(attendee.location)
                    .font(.caption)
            }
            
            Button {
                eventsViewModel.removeAttendee(attendee: attendee, from: eventID)
            } label: {
                Image(systemName: "minus.circle")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
            }
        }
    }
}

#Preview {
    AttendeeCardView(attendee: Attendee(firstName: "Mohamed", middleName: "El", lastName: "Halawani", location: "Algonquin College"), eventID: UUID())
}
