//
//  ProfileView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct ProfileView: View {
    private var user = User(firstName: "Asif", lastName: "Ashadullah", avatar: "YES", isHost: true, location: "Ottawa, ON", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
    
    var body: some View {
        VStack {
            HStack() {
                Image(systemName: "square.and.pencil")
                    .imageScale(.large)
                    .foregroundStyle(.blue)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 24) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 128, height: 128)
                        .foregroundStyle(.gray)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(user.fullName)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(user.location)
                            .font(.title3)
                    }
                }
                
                Divider()
                    .frame(height: 4)
                
                Text(user.bio ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
        }
        .padding(24)
    }
}

#Preview {
    ProfileView()
}
