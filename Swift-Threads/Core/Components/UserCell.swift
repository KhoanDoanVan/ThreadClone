//
//  UserCell.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 08/02/2024.
//

import SwiftUI

struct UserCell: View {
    
    let user : User
    
    var body: some View {
        VStack{
            HStack{
                CircularProfileImageView(user: user, size: .small)
                
                VStack(alignment : .leading, spacing: 3){
                    Text(user.username)
                        .fontWeight(.semibold)
                    
                    Text(user.fullname)
                }
                .font(.footnote)
                
                Spacer()
                
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
                
            }
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}

//#Preview {
//    UserCell(user : dev.user)
//}

struct UserCell_Preview: PreviewProvider{
    static var previews: some View{
        UserCell(user : dev.user)
    }
}
