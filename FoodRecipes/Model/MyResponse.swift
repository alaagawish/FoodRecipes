//
//  MyResponse.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation

struct MyResponse: Decodable {
    
    let count: Int
    let results: [Result]
    
}
