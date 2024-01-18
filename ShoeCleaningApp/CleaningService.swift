//
//  CleaningService.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//

import Foundation

class CleaningService {
    var shoes: [String] = []

    func addShoe(_ shoe: String) {
        shoes.append(shoe)
    }

    func cleanShoes() {
        print("Cleaning shoes: \(shoes.joined(separator: ", "))")
    }
}
