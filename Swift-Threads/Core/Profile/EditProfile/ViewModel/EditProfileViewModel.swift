//
//  EditProfileViewModel.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation
import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject{
    
    @Published var selectedIteam: PhotosPickerItem? { // whenever selection in EditProfileView PhotoPicker item then call this variable
        didSet {
            Task { await loadImage() }
        }
    }
    @Published var profileImage: Image?
    private var uiImage : UIImage?
    
    func updateUserData() async throws {
        try await uploadImage()
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedIteam else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func uploadImage() async throws {
        guard let image = self.uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadImage(image: image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
}
