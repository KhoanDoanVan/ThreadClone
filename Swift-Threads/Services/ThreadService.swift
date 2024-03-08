//
//  ThreadService.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class ThreadService{
    
    static func uploadThread(thread : Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
                
        return snapshot.documents.compactMap({
            try? $0.data(as : Thread.self)
        })
    }
    
    static func fetchUserThreads(uid : String) async throws -> [Thread] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid) // if you use whereField you can't use comtemporary with order() which sort the most recent thread
            .getDocuments()
        
        let threads = snapshot.documents.compactMap({
            try? $0.data(as : Thread.self)
        })
        
        return threads.sorted(by: {  // snippet sort by timestamp same order above
            $0.timestamp.dateValue() > $1.timestamp.dateValue() // get the valuedate properties of element has position 0 and compares it with datavalue of element 1
        })
    }
}
