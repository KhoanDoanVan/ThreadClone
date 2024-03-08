//
//  LoginView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
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
            }
            .padding(.top)
            
            NavigationLink{
                Text("Forgot password View")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.trailing, 28)
                    .padding(.vertical)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Button(action: {
                Task{
                    try await viewModel.login()
                }
            }, label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 350, height: 50)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            
            Spacer()
            
            Divider()
            
            NavigationLink{
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label : {
                HStack (spacing : 3){
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
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
    LoginView()
}
