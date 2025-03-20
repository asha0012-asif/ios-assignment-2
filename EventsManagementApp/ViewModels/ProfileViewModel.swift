//
//  ProfileViewModel.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    
    func saveUser(_ user: User) {
        self.user = user
    }
    
    func deleteUser() {
        self.user = nil
    }
}
