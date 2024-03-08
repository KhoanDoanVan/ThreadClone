//
//  ThreadCreationViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation
import Firebase

@MainActor
class CreationViewModel: ObservableObject{
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(caption: caption, ownerUid: uid, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread: thread)
    }
}
