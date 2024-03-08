//
//  Timestamp.swift
//  Swift-Threads
//
//  Created by Đoàn Văn Khoan on 24/02/2024.
//

import Foundation
import Firebase

extension Timestamp { // edit prospertise of the Timestamp Firebase
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [ .hour, .minute, .second, .weekOfMonth, .day]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
