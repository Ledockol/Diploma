//
//  Employee.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//

import Foundation
//Структура сотрудников
struct Employee: Identifiable, Hashable, Codable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var position: String
}
