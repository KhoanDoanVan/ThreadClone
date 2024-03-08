//
//  ContentView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                ThreadTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
