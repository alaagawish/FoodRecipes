//
//  Show.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Show: Decodable{
    let name: String?
    let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }}
