//
//  ProfileViewModel.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User = User (
        firstName: "[FIRST_NAME]",
        lastName: "[LAST_NAME]",
        isHost: true,
        location: "[LOCATION]",
        bio: "[BIO]"
    )
    
    func saveUser(_ user: User) {
        self.user = user
    }

    // I wanted to have default values for the host of an event thus
    // deleted the user like so
    func deleteUser() {
        self.user = User (
            firstName: "[FIRST_NAME]",
            lastName: "[LAST_NAME]",
            isHost: true,
            location: "[LOCATION]",
            bio: "[BIO]"
        )
    }
}
