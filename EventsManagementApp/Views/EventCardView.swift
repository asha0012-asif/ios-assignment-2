//
//  EventCardView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct EventCardView: View {
    var event: Event
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageData = event.backgroundImage,
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
            
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.black.opacity(0.8), location: 0.0),
                    .init(color: Color.black.opacity(0.0), location: 0.4)
                ]),
                startPoint: .bottom,
                endPoint: .top
            )
            .frame(width: 360, height: 270)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(event.name)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(event.location)
                    .foregroundStyle(.white)
            }
            .padding(16)
        }
    }
}

#Preview {
    EventCardView(event: Event(name: "eventName", startDate: Date(), endDate: Date(), location: "location", description: "eventDescription", attendees: [Attendee(firstName: "Mohamed", lastName: "Halawani"), Attendee(firstName: "Tony", lastName: "Davidson")]))
}
