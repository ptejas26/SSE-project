//
//  Item.swift
//  SSE-Xcode15
//
//  Created by Tejas Patelia on 2024-06-16.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
