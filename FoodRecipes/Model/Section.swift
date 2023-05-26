//
//  Section.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Section: Decodable{
    let components: [Component]
    let name: String?
    let position: Int
    
    private enum CodingKeys: String, CodingKey {
        case components = "components"
        case name = "name"
        case position = "position"
    }
}
