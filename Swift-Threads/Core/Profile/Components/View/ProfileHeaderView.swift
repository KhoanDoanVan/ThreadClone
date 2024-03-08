//
//  ProfileHeaderView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 15/02/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user : User?
    
    init(user : User?){
        self.user = user
    }
    
    var body: some View {
        HStack(alignment : .top){
            VStack (alignment: .leading, spacing : 12){
                VStack (alignment : .leading){
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
//                            if let bio = currentUser?.bio {
//                                Text("1y8m with @_memehan_  👸")
//                                    .font(.footnote)
//                            }
                Text("1y8m with @_memehan_  👸")
                    .font(.footnote)
                
                Text("400 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user : user, size: .medium)
        }

    }
}

#Preview {
    ProfileHeaderView(user : DeveloperPreview.shared.user)
}
