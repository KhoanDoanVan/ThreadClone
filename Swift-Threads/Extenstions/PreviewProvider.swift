//
//  PreviewProvider.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 18/02/2024.
//

import SwiftUI
import Firebase

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview{
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Doan Van Khoan", email: "simonsidev@gmail.com", username: "simonisdev")
    
    let thread = Thread(caption: "is bad", ownerUid: "123", timestamp: Timestamp(), likes: 0)
}
