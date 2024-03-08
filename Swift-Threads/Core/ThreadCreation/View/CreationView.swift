//
//  CreationView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct CreationView: View {
    
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CreationViewModel()
    
    private var user : User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack (alignment : .top){
                    CircularProfileImageView(user : user, size: .small)
                    
                    VStack (alignment : .leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text : $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button{
                            caption = "" // if click then reset caption and display empty on screen
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement : .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement : .navigationBarTrailing){
                    Button("Post"){
                        Task{
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1)
                    .disabled(caption.isEmpty) // if isEmpty mustn't click
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    CreationView()
}
