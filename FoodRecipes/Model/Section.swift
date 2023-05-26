//
//  Section.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Section: Decodable{
    let components: [Component]
    let name: String
    //    let position: Int
}
