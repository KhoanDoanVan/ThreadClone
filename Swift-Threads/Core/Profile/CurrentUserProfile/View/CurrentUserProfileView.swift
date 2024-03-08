//
//  CurrentUserProfileView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 15/02/2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
        
    private var currentUser : User? {
        return viewModel.currentUser
    }

    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators : false){
                VStack (spacing : 20){
                    
                    ProfileHeaderView(user : currentUser)
                                        
                    Button{
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                }
                .padding(.horizontal)
                
                // it relative from UserContentListViewModel
                if let user = currentUser {
                    UserContentListView(user: user)
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user : user)
                }
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
