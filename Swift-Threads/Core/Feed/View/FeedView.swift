//
//  FeedView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators : false){
                LazyVStack{
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {  // add effect reload on top
                Task{
                    try await viewModel.fetchThreads()
                }
            }
            .navigationTitle("Threads") // name title scroll view
            .navigationBarTitleDisplayMode(.inline) // position put name title
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    Task{
                        try await viewModel.fetchThreads()
                    }
                } label: {
                    Image(systemName: "arrow.circlepath")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
    }
}
