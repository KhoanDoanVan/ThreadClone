//
//  CircularProfileImageView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 08/02/2024.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimesion : CGFloat {
        switch self {
        case .xxSmall : return 28
        case .xSmall : return 32
        case .small : return 40
        case .medium : return 48
        case .large : return 64
        case .xLarge : return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    let user : User?
    let size : ProfileImageSize
        
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            RemoteImage(url: "\(imageUrl)")
                .scaledToFit()
                .frame(width: size.dimesion, height: size.dimesion)
                .cornerRadius(50)
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimesion, height: size.dimesion)
                .foregroundColor(Color(.systemGray4))
        }
    }
    
}



#Preview {
    CircularProfileImageView(user : DeveloperPreview.shared.user, size: .medium)
}
