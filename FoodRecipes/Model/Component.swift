//
//  Component.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Component: Decodable{
    let position: Int
    // let measurements: [Measurement]
    // let id: Int
    let rawText: String
    let extraComment: String
    let ingredient: Ingredient
}
