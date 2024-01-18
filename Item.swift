//
//  Item.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
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
