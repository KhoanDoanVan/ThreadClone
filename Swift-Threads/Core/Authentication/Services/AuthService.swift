//
//  AuthService.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 11/02/2024.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    // tracking user login or not login
    @Published var userSession : FirebaseAuth.User?
    
    static let shared = AuthService()
    
    // constuctor
    init(){
        self.userSession = Auth.auth().currentUser // how ???
    }
    
    @MainActor
    func login(withEmail email : String, password : String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user // set session
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG : user login \(result.user.uid)")
        } catch {
            print("DEBUG : Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email : String, password : String, fullname : String, username : String) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user // set session
            try await uploadUserData(id: result.user.uid, withEmail: email, fullname: fullname, username: username)
            print("DEBUG : Create user \(result.user.uid)")
        } catch {
            print("DEBUG : Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut() // sign out on backend
        self.userSession = nil
        UserService.shared.reset()
    }
    
    // upload user into firestore
    @MainActor
    private func uploadUserData(id : String,withEmail email : String, fullname : String, username : String) async throws{
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
}
