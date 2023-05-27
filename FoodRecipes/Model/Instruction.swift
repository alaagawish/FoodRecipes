//
//  Instruction.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Instruction: Decodable{
    // let appliance: Any
    let endTime: Int?
    // let temperature: Any
    let id: Int?
    let position: Int?
    let displayText: String?
    let startTime: Int?
    
    private enum CodingKeys: String, CodingKey {
        //  case appliance = "appliance"
        case endTime = "end_time"
        //  case temperature = "temperature"
        case id = "id"
        case position = "position"
        case displayText = "display_text"
        case startTime = "start_time"
    }
}
