//
//  ExploreView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    @State private var search = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users) {
                        user in
                        NavigationLink(value: user, label: {
                            VStack{
                                UserCell(user : user)
                                
                                Divider()
                            }
                        })
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user : user)
            })
            .navigationTitle("Search")
            .searchable(text: $search, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
