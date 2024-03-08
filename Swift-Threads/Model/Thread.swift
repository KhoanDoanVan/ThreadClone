//
//  Thread.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable{
    @DocumentID var threadId : String?
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    let caption: String
    let ownerUid: String
    let timestamp: Timestamp
    var likes: Int // can't change so it use var is mutable
    
    var user : User? // i need to declare user here for i can use id above and catch the user profile
}
