//
//  RemoteImage.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 23/02/2024.
//

import Foundation
import SwiftUI

struct RemoteImage: View {
    let url: String

    var body: some View {
        // Use an asynchronous image loader
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                // Placeholder or loading state
                ProgressView()
            case .success(let image):
                // Successfully loaded image
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                // Error state
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.red)
            @unknown default:
                // Handle unknown cases
                EmptyView()
            }
        }
    }
}
