//
//  Measurement.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation

struct Measurement: Decodable {
    
    let unit: Unit
    let quantity: String
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case unit = "unit"
        case quantity = "quantity"
        case id = "id"
    }
    
}
