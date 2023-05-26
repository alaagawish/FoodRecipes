//
//  UserRatings.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct UserRatings: Decodable{
    let countPositive: Int
    let score: Float
    let countNegative: Int?
    
    private enum CodingKeys: String, CodingKey {
        case countPositive = "count_positive"
        case score = "score"
        case countNegative = "count_negative"
    }
}
