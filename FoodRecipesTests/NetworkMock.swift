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
    var myResponse = MyResponse(count: 10, results: [Result(seoTitle: "seoTitle", language: "english", price: nil, slug: "slug", numServings: 4, showId: 555, show: nil, renditions: [], isShoppable: false, canonicalId: "5553", keywords: "food", aspectRatio: "1:3", thumbnailAltText: nil, topics: [], servingsNounSingular: "servingsNounSingular", tags: [], name: "name", thumbnailUrl: nil, promotion: "promotion", country: "Egypt", sections: [], isOneTop: true, yields: "yield", servingsNounPlural: "servingsNounPlural", instructions: [], userRatings: nil, id: 1234, createdAt: 333, description: "description", nutritionVisibility: "visible", draftStatus: "status", approvedAt: 22, nutrition: nil, tipsAndRatingsEnabled: false, credits: [], similarity: 222.9)])
    
    func getData(path: String, parameters: Alamofire.Parameters, handler: @escaping (FoodRecipes.MyResponse?) -> Void) {
        if isSuccess{
            handler(myResponse)
        }else{
            handler(nil)
        }
    }
    
    
}
