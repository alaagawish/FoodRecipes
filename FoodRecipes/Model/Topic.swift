//
//  Topic.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
struct Topic: Decodable{
    //   let updatedAt: String
    let portion: Int?
    let consumptionTotal: Int?
    let consumptionPortion: Int?
    let total: Int?
    
    private enum CodingKeys: String, CodingKey {
        //    case updatedAt = "updated_at"
        case portion = "portion"
        case consumptionTotal = "consumption_total"
        case consumptionPortion = "consumption_portion"
        case total = "total"
    }
    
    
    
}
