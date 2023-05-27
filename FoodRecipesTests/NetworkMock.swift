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

    let files = MockApiFileLoader().loadApiFiles()
    func getData(path: String, parameters: Alamofire.Parameters, handler: @escaping (FoodRecipes.MyResponse?) -> Void) {
        if isSuccess{
//            print(files)
            handler(files)
          //  handler(files[0])
        }else{
            handler(nil)
        }
    }
    
    
}
