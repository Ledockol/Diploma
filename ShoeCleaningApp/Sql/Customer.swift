//
//  Customer.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//

import Foundation

struct Customer: Identifiable, Hashable, Codable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var phone: String
    var services: [String]
}
