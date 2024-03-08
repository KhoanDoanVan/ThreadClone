//
//  ProfileViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 13/02/2024.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject, Observable{    
    @Published var currentUser: User? // able have nil
    private var cancellabies = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink{ [weak self] user in
            self?.currentUser = user
            print("DEBUG:: user in view model combine is \(self?.currentUser)")
        }.store(in: &cancellabies)
    }
}
