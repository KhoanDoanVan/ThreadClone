//
//  FeedCell.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import SwiftUI

struct ThreadCell: View {
    
    var thread : Thread
    
    var body: some View {
        VStack{
            HStack (alignment : .top){
                CircularProfileImageView(user: thread.user, size: .small)
                
                VStack(alignment : .leading, spacing : 4){
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray2))
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        })
                    }
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    
                    HStack(spacing : 16){
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperplane")
                        })
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                }
            }
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread : DeveloperPreview.shared.thread)
}
