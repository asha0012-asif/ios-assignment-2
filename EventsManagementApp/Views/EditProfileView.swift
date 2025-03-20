//
//  EditProfileView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var firstName: String = ""
    @State var middleName: String = ""
    @State var lastName: String = ""
    @State var location: String = ""
    @State var bio: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField(text: $firstName) {
                        Text("First Name")
                    }
                    
                    TextField(text: $middleName) {
                        Text("Middle Name")
                    }
                    
                    TextField(text: $lastName) {
                        Text("Last Name")
                    }
                }
                
                Section {
                    TextField(text: $location) {
                        Text("Location")
                    }
                }
                
                Section {
                    TextField(text: $bio, axis: .vertical) {
                        Text("Bio")
                    }
                    .lineLimit(5)
                }
                
                Section {
                    Button {
                        print("SAVED")
                        dismiss()
                    } label: {
                        Text("Save Profile")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button {
                        print("DELETED")
                        dismiss()
                    } label: {
                        Text("Delete Profile")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .navigationTitle(Text("Edit Profile"))
    }
}

#Preview {
    EditProfileView()
}
