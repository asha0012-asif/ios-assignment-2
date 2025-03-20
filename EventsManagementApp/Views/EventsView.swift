//
//  EventsView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct EventsView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    @State private var selectedSegment: Int = 0
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Welcome \(profileViewModel.user?.firstName ?? "[USER]")")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(destination: Text("AddEventView")) {
                    Image(systemName: "plus.square")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
            .frame(maxWidth: .infinity)
            
            VStack(spacing: 16) {
                Picker("Select Option", selection: $selectedSegment) {
                    Text("Upcoming").tag(0)
                    Text("Past").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                if selectedSegment == 0 {
                    Text("No upcoming events")
                } else {
                    Text("No past events")
                }
            }

            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    EventsView()
}
