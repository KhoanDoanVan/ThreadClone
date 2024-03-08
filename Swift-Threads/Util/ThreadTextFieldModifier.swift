//
//  ThreadTextFieldModifier.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 07/02/2024.
//

import Foundation
import SwiftUI

struct ThreadTextFieldModifier : ViewModifier{
    func body(content : Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 25)
    }
}
