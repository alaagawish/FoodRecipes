//
//  Result.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Result: Decodable{
    let renditions: [Rendition]
    let beauty_url: String?
    let cook_time_minutes: Int?
    let country: String
    let slug: String
    let brand_id: Int?
    let inspired_by_url: String
    let prep_time_minutes: Int?
    let tags: [Tag]
    let aspect_ratio: String
    let thumbnail_alt_text: String
    let nutrition_visibility: String
    let instructions: [Instruction]
    let keywords: String
   // let price: Dictionary<String, Any>
    let approved_at: Double
    let yields: String
    let updated_at: Double
    let is_one_top: Bool
    let servings_noun_plural: String
    let video_id: Int
    let brand: String?
    let servings_noun_singular: String
    let buzz_id: Int?
    let description: String
}
