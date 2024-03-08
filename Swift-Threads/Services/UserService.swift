//
//  UserService.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 13/02/2024.
//

import Firebase
import FirebaseFirestoreSwift

class UserService{
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init(){
        Task{
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as : User.self) // decode user current information
        self.currentUser = user
        
        print("DEBUG:: User information current is \(user)")
    }
    
    static func fetchUsers() async throws -> [User] { // force this function return array
        // fetch current uid
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        // fetch all documents
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        // fetch all collections users
        let users = snapshot.documents.compactMap({
            try? $0.data(as : User.self) // convert data to User model and filter out nil value
        })
        // return list users except uid current user by filter
        return users.filter({ $0.id != currentUid })
    }
    
    static func fetchUser(withUid uid : String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func reset(){
        self.currentUser = nil
    }

    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl : String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl" : imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
