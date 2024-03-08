//
//  PreviewProvider.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 14/02/2024.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Doan Van Khoan", email: "simonisdev@gmail.com", username: "simonisdev_play")
}
