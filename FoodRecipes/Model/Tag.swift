//
//  Tag.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Tag: Decodable{
    let rootTagType: String
    let name: String?
    let id: Int
    let displayName: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case rootTagType = "root_tag_type"
        case name = "name"
        case id = "id"
        case displayName = "display_name"
        case type = "type"
    }
}
