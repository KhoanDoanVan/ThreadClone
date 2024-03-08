//
//  EditProfileView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 10/02/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user : User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack (alignment : .leading){
                    HStack{
                        VStack(alignment : .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        }
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedIteam, label: {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user : user, size: .small)
                            }
                        })
                    }
                    
                    Divider()
                    
                    VStack (alignment : .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text : $bio, axis: .vertical)
                    }
                    
                    Divider()
                    
                    VStack (alignment : .leading){
                        Text("Link")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text : $link)
                    }
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth : 1)
                }
                .padding() // trick
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Done"){
                        Task{
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user : DeveloperPreview.shared.user)
}
