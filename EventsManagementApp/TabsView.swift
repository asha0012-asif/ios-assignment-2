//
//  TabsView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct TabsView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @StateObject var eventsViewModel = EventsViewModel()
    
    var body: some View {
        TabView {
            Tab("Events", systemImage: "calendar") {
                NavigationView {
                    EventsView()
                }
                .environmentObject(eventsViewModel)
                .environmentObject(profileViewModel)
            }
            
            Tab("Profile", systemImage: "person") {
                NavigationView {
                    ProfileView()
                }
                .environmentObject(profileViewModel)
            }
        }
    }
}

#Preview {
    TabsView()
}
