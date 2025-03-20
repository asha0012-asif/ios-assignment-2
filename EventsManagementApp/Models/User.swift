//
//  User.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

struct User: Identifiable {
    let id: UUID = UUID()
    var firstName: String
    var middleName: String?
    var lastName: String
    var avatar: String?
    var isHost: Bool
    
    var location: String
    var bio: String?
    
    var fullName: String {
       return middleName != nil ? "\(firstName) \(middleName!) \(lastName)" : "\(firstName) \(lastName)"
    }
}
