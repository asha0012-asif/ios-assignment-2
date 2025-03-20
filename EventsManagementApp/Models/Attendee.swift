//
//  Attendee.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import Foundation

struct Attendee: Identifiable {
    let id: UUID = UUID()
    var firstName: String
    var middleName: String? = nil
    var lastName: String
    var avatar: String? = nil
    var isHost: Bool = false
    
    var location: String
    var bio: String?
    
    var fullName: String {
       return middleName != nil ? "\(firstName) \(middleName!) \(lastName)" : "\(firstName) \(lastName)"
    }
}
