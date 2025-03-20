//
//  ManageAttendeesView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct ManageAttendeesView: View {
    var body: some View {
        VStack {
            Text("Manage Attendees")
        }
        .navigationTitle(Text("Manage Attendees"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddAttendeeView()) {
                    Image(systemName: "plus.square")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    ManageAttendeesView()
}
