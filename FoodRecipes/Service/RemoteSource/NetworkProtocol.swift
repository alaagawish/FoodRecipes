//
//  NetworkProtocol.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
import Alamofire

protocol NetworkProtocol{
    
    func getData(path: String, parameters: Parameters, handler: @escaping (MyResponse?) -> Void)
    func getRecipeData(path: String, parameters: Parameters, handler: @escaping (Result?) -> Void)
    
}
