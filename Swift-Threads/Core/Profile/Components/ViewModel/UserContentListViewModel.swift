//
//  UserContentListViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 24/02/2024.
//

import Foundation

@MainActor
class UserContentListViewModel: ObservableObject{
    @Published var threads = [Thread]()
    
    let user : User
    
    init(user : User){
        self.user = user
        Task{
            try await fetchUserThreads()
        }
    }
    
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id) // fetch all threads by id user clicked
        
        for i in 0..<threads.count {
            threads[i].user = self.user  // reference user into threads list, i mean it will update the imageUI once threads
        }
        
        self.threads = threads
    }
}
