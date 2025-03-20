//
//  ProfileView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: EditProfileView()) {
                    Image(systemName: "square.and.pencil")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 24) {
                    if let imageData = profileViewModel.user?.avatar,
                       let image = ImageUtils.decodeBase64ToImage(base64String: imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 128, height: 128)
                            .clipShape(.circle)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 128, height: 128)
                            .foregroundStyle(.gray)
                            .clipShape(.circle)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(profileViewModel.user?.fullName ?? "[FULL_NAME]")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text(profileViewModel.user?.location ?? "[LOCATION]")
                            .font(.title3)
                    }
                }
                
                Divider()
                    .frame(height: 4)
                
                Text(profileViewModel.user?.bio ?? "[BIO]")
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
