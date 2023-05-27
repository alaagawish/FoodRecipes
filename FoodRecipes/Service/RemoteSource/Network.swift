//
//  Network.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
import Alamofire

class Network: NetworkProtocol{
    func getData(path: String, parameters: Alamofire.Parameters, handler: @escaping (MyResponse?) -> Void) {
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key": "0264cbf91bmsh7e61711554b7b6fp107e57jsn8d79ba4e5c1c",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        
        AF.request("https://tasty.p.rapidapi.com/recipes/\(path)", parameters: parameters, headers: headers).responseDecodable(of: MyResponse.self) { response in
            switch response.result {
            case .success(let data):
                print("done")
                handler(data)
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
    
    
}
