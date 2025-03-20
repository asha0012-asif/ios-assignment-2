//
//  TabsView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            Tab("Events", systemImage: "calendar") {
                NavigationView {
                    EventsView()
                }
            }
            
            Tab("Profile", systemImage: "person") {
                NavigationView {
                    ProfileView()
                }
            }
        }
    }
}

#Preview {
    TabsView()
}
