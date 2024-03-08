//
//  ProfileThreadFilter.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 09/02/2024.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable{
    case threads
    case replies
    
    var title: String{
        switch self{
        case .threads : return "Threads"
        case .replies : return "Replies"
        }
    }
    
    var id : Int{ return self.rawValue } // rawValue is 0, 1, 2, 3 
}
