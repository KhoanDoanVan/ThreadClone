//
//  UserContentListView.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 15/02/2024.
//

import SwiftUI

struct UserContentListView: View {
    
    @StateObject var viewModel : UserContentListViewModel // still not initialize
    @State private var selectedFilter : ProfileThreadFilter = .threads // default equal 0(thread)
    @Namespace var animate
    
    private var filterBarWidth: CGFloat{
        let count = CGFloat(ProfileThreadFilter.allCases.count) // count amount instance in enum
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user : User) { // initialize user object
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user)) // the underscore cue to you that it should use the mark private and it not use for access control anything
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(ProfileThreadFilter.allCases){ filter in
                    VStack{
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(filter == selectedFilter ? .semibold : .regular)
                        
                        if selectedFilter == filter{
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: filterBarWidth,height: 1)
                                .matchedGeometryEffect(id: "item", in: animate)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth,height: 1)
                        }
                    }
                    .onTapGesture { // set animation
                        withAnimation(.spring()){
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack{
                ForEach(viewModel.threads){ thread in
                    ThreadCell(thread: thread)
                }
            }
        }
    }
}

#Preview {
    UserContentListView(user : DeveloperPreview.shared.user)
}
