//
//  User.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 13/02/2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl : String?
//    var bio: String
}
