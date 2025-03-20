//
//  ContentView.swift
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
                    Text("Events")
                }
            }
            
            Tab("Profile", systemImage: "person") {
                NavigationView {
                    Text("Profile")
                }
            }
        }
    }
}

#Preview {
    TabsView()
}
