//
//  NetworkMock.swift
//  FoodRecipesTests
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
@testable import FoodRecipes
@testable import Alamofire
class NetworkMock: NetworkProtocol{
    var isSuccess: Bool!
    init(isSuccess: Bool!) {
        self.isSuccess = isSuccess
    }
    var myResponse = MyResponse(count: 10, results: [])
    func getData(path: String, parameters: Alamofire.Parameters, handler: @escaping (FoodRecipes.MyResponse?) -> Void) {
        if isSuccess{
            handler(myResponse)
        }else{
            handler(nil)
        }
    }
    
    
}
