//
//  Instruction.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Instruction: Decodable{
    let start_time: Int
    let appliance: String
    let end_time: Int
    let temperature: Int
    let id: Int
    let position: Int
    let display_text: String
}
