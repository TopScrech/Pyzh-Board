//
//  Item.swift
//  Multiboard
//
//  Created by Sergei Saliukov on 08/01/2024.
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
