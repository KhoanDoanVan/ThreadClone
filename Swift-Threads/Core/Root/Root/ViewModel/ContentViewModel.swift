//
//  ContentViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 13/02/2024.
//

import Foundation
import Firebase
import Combine

class ContentViewModel: ObservableObject{
    @Published var userSession : FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
