//
//  EventsView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct EventsView: View {
    @EnvironmentObject var eventsViewModel: EventsViewModel
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    @State private var selectedSegment: Int = 0
    
    private var upcomingEvents: [Event] {
        return eventsViewModel.events.filter { $0.startDate > Date() }
    }
    
    private var pastEvents: [Event] {
        return eventsViewModel.events.filter { $0.startDate < Date() }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Welcome \(profileViewModel.user.firstName)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(destination: AddEventView()) {
                    Image(systemName: "plus.square")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
            
            VStack(spacing: 16) {
                Picker("Select Option", selection: $selectedSegment) {
                    Text("Upcoming").tag(0)
                    Text("Past").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                if selectedSegment == 0 {
                    if upcomingEvents.isEmpty {
                        Text("No upcoming events")
                    } else {
                        List {
                            ForEach(upcomingEvents) { event in
                                EventCardView(event: event)
                            }
                        }
                        .listStyle(.plain)
                    }
                } else {
                    if pastEvents.isEmpty {
                        Text("No past events")
                    } else {
                        List {
                            ForEach(pastEvents) { event in
                                EventCardView(event: event)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }

            Spacer()
        }
    }
}

#Preview {
    EventsView()
}
