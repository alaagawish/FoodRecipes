//
//  Ingredient.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Ingredient: Codable {
    
    // let updatedAt: Int
    let name: String?
    let createdAt: Int
    let displayPlural: String
    let id: Int
    let displaySingular: String
    
    private enum CodingKeys: String, CodingKey {
        //case updatedAt = "updated_at"
        case name = "name"
        case createdAt = "created_at"
        case displayPlural = "display_plural"
        case id = "id"
        case displaySingular = "display_singular"
    }
    
}
