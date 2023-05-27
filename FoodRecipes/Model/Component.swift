//
//  Component.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Component: Decodable{
    let rawText: String?
    let extraComment: String?
    let ingredient: Ingredient?
    let id: Int?
    let position: Int?
    let measurements: [Measurement]?
    
    private enum CodingKeys: String, CodingKey {
        case rawText = "raw_text"
        case extraComment = "extra_comment"
        case ingredient = "ingredient"
        case id = "id"
        case position = "position"
        case measurements = "measurements"
    }
}
