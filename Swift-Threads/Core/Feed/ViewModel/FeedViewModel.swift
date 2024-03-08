//
//  FeedViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation


// Hey, fetch the thread and then fetch the user and than update the UI user(image)

@MainActor
class FeedViewModel: ObservableObject{
    @Published var threads = [Thread]()
    
    init(){
        Task{
            try await fetchThreads()
        }
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads() // the first you will fetch threads and after that to do fetchUserData by thread owner -> improve performance
        try await fetchUserDataForThreads()
    }
    
    func fetchUserDataForThreads() async throws {
        for i in 0..<threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let userOfThread = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = userOfThread // update user of thread in Published variable
        }
    }
}
