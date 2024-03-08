//
//  ExploreViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 14/02/2024.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task{ try await fetchUsers() }
    }
    
    @MainActor // after fetchUsers on overbackground it will return main background and update Published variable
    private func fetchUsers() async throws{
        self.users = try await UserService.fetchUsers()
    }
}
