//
//  EventsManagementApp.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

@main
struct EventsManagementApp: App {
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabsView()
                .environmentObject(profileViewModel)
        }
    }
}
