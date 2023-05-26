//
//  Recipe.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Recipe: Decodable {
    
    let sections: [Section]
    let id: Int
    let name: String
    let originalVideoUrl: String
    let yields: String
    let show: Show
    let instructions: [Instruction]
    let thumbnailUrl: String
    
}
