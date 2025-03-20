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
    var lastName: String
    var avatar: String? = nil
    var isHost: Bool = false
}
