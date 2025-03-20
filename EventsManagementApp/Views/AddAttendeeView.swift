//
//  AddAttendeeView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI
import PhotosUI

struct AddAttendeeView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var eventsViewModel: EventsViewModel
    
    var eventId: UUID
    
    @State var firstName: String = ""
    @State var middleName: String = ""
    @State var lastName: String = ""
    @State var location: String = ""
    @State var bio: String = ""
    
    @State private var avatarImage: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            Form {
                Section {
                    VStack {
                        PhotosPicker(selection: $photosPickerItem, matching: .images) {
                            if let avatarImage {
                                Image(uiImage: avatarImage)
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
                        }
                        
                        Text("Choose Image")
                            .foregroundStyle(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.clear)
                
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
                        var attendee = Attendee(firstName: firstName, lastName: lastName, location: location)
                        
                        if middleName != "" {
                            attendee.middleName = middleName
                        }
                        
                        if bio != "" {
                            attendee.bio = bio
                        }
                        
                        if let avatarImage {
                            if let imageData = avatarImage.jpegData(compressionQuality: 0.8) {
                                attendee.avatar = imageData.base64EncodedString()
                            }
                        }
                        
//                        eventsViewModel.addAttendee(attendee: attendee, to: event)
                    
                        dismiss()
                    } label: {
                        Text("Add Attendee")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationTitle(Text("Add Attendee"))
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        avatarImage = image
                    }
                }
                
                photosPickerItem = nil
            }
        }
    }
}

#Preview {
//    AddAttendeeView()
}
