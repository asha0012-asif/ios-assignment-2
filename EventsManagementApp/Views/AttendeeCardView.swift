//
//  AttendeeCardView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct AttendeeCardView: View {
    var name: String = ""
    var location: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .foregroundStyle(.gray)
                .clipShape(.circle)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.headline)
                Text(location)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    AttendeeCardView()
}
