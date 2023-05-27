//
//  Unit.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Unit: Decodable {
    
    let system: String?
    let name: String?
    let displayPlural: String?
    let displaySingular: String?
    let abbreviation: String?
    
    private enum CodingKeys: String, CodingKey {
        case system = "system"
        case name = "name"
        case displayPlural = "display_plural"
        case displaySingular = "display_singular"
        case abbreviation = "abbreviation"
    }
    
}
