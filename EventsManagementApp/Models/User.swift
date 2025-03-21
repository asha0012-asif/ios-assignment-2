//
//  User.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    var firstName: String = "[FIRST_NAME]"
    var middleName: String?
    var lastName: String = "[LAST_NAME]"
    var avatar: String? = nil
    var isHost: Bool = true
    
    var location: String = "[LOCATION]"
    var bio: String? = "[BIO]"
    
    var fullName: String {
       return middleName != nil ? "\(firstName) \(middleName!) \(lastName)" : "\(firstName) \(lastName)"
    }
}
