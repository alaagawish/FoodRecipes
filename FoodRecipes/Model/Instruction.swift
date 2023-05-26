//
//  Instruction.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Instruction: Decodable{
    let startTime: Int
    //let appliance: String
    //let endTime: Int
    //let temperature: Int
    let id: Int
    let position: Int
    let displayText: String
}
