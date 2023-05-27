//
//  Credit.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Credit: Decodable{
    
    let name: String?
    let type: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
    }
}
