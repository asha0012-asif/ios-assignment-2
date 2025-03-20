//
//  AddEventView.swift
//  EventsManagementApp
//
//  Created by Asif Ashadullah on 2025-03-20.
//

import SwiftUI
import PhotosUI

struct AddEventView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var eventName: String = ""
    @State var location: String = ""
    
    @State private var isAllDay: Bool = false
    @State var startDate: Date = Date()
    @State var endDate: Date = Date()
    
    @State var eventDescription: String = ""
    @State var attendees: [Attendee]? = nil
    
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
                                    .frame(width: 384, height: 288)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            } else {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 384, height: 288)
                                    .foregroundStyle(.gray)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        
                        Text("Choose Image")
                            .foregroundStyle(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .listRowBackground(Color.clear)
                
                Section {
                    TextField(text: $eventName) {
                        Text("Event Name")
                    }
                    TextField(text: $location) {
                        Text("Location")
                    }
                }
                
                Section {
                    Toggle("All Day", isOn: $isAllDay)
                    
                    DatePicker("Starts",
                               selection: $startDate,
                               displayedComponents: isAllDay ? [.date] : [.date, .hourAndMinute]
                    )
                    .datePickerStyle(CompactDatePickerStyle())
                    
                    DatePicker("Ends",
                               selection: Binding(
                                get: { isAllDay ? startDate : endDate },
                                set: { endDate = $0 }
                               ),
                               displayedComponents: isAllDay ? [.date] : [.date, .hourAndMinute]
                    )
                    .datePickerStyle(CompactDatePickerStyle())
                }
                
                Section {
                    TextField(text: $eventDescription, axis: Axis.vertical) {
                        Text("Describe the event")
                    }
                    .lineLimit(5)
                }
                
                Section {
                    NavigationLink(destination: Text("AddAttendeesView")) {
                        Text("Attendees")
                    }
                }
                
                Section {
                    Button {
                        print("Added New Event")
                        
                        dismiss()
                    } label: {
                        Text("Create Event")
                    }
                }
                
            }
        }
        .navigationTitle(Text("Add Event"))
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
    AddEventView()
}
