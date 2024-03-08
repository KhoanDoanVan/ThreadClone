//
//  ProfileView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user : User
            
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack (spacing : 20){
                
                ProfileHeaderView(user: user)
                
                Button{
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
            
            UserContentListView(user : user)
        }
        .navigationBarTitleDisplayMode(.inline)
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

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}


