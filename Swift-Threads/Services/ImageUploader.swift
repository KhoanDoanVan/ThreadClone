//
//  ImageUploader.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation
import Firebase
import FirebaseStorage


// we still can upload the image in swiftUI by UIImage
struct ImageUploader{
    static func uploadImage(image : UIImage) async throws -> String? { // force the function return type of String URL image public
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil } // fix the quality of image
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(filename)")

        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG:: Error for upload the image with error:\(error.localizedDescription)")
            return nil
        }
    }
}
