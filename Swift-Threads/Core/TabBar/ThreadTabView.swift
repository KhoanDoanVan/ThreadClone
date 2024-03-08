//
//  ThreadTabView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct ThreadTabView: View {

    @State private var selected = 0
    @State private var showCreateThreadView = false
    
    var body: some View {
        
        TabView(selection: $selected){
            FeedView()
                .tabItem {
                    Image(systemName: selected == 0 ? "house.fill" : "house" )
                        .environment(\.symbolVariants, selected == 0 ? .fill : .none)
                }
                .onAppear {
                    selected = 0
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {
                    selected = 1
                }
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear {
                    selected = 2
                }
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selected == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selected == 3 ? .fill : .none)
                }
                .onAppear {
                    selected = 3
                }
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selected == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selected == 4 ? .fill : .none)
                }
                .onAppear {
                    selected = 4
                }
                .tag(4)
        }
        .onChange(of: selected) { oldValue, newValue in
//            showCreateThreadView = newValue == 2
            
            if newValue == 2{
                showCreateThreadView = true
            }
        }
        .sheet(isPresented: $showCreateThreadView, onDismiss: { selected = 0 }, content: {
            CreationView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadTabView()
}
