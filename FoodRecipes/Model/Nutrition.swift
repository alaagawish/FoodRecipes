//
//  Nutrition.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Nutrition: Decodable{
    let carbohydrates: Int?
    let fiber: Int?
    let updatedAt: String?
    let protein: Int?
    let fat: Int?
    let calories: Int?
    let sugar: Int?
    
    private enum CodingKeys: String, CodingKey {
        case carbohydrates = "carbohydrates"
        case fiber = "fiber"
        case updatedAt = "updated_at"
        case protein = "protein"
        case fat = "fat"
        case calories = "calories"
        case sugar = "sugar"
    }
}
