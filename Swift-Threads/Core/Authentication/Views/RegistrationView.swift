//
//  RegistrationView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            
            Spacer()
            
            Image("icon-threads")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            VStack{
                TextField("Enter your email", text : $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadTextFieldModifier())
                
                SecureField("Enter your password", text : $viewModel.password)
                    .modifier(ThreadTextFieldModifier())
                
                TextField("Enter your fullname", text : $viewModel.fullname)
                    .modifier(ThreadTextFieldModifier())
                
                TextField("Enter your username", text : $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadTextFieldModifier())
            }
            .padding(.vertical)
            
            Button(action: {
                Task {
                    try await viewModel.createUser()
                }
            }, label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 350, height: 50)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button{
                dismiss()
            } label : {
                HStack (spacing : 3){
                    Text("Already have an account?")
                    
                    Text("Login")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
