//
//  DetailsViewModel.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import Foundation

class DetailsViewModel{
    
    var bindRecipeDetails: (()->()) = {}
    var bindSimilarRecipes: (()->()) = {}
    var network:NetworkProtocol!
    var recipeDetails: Result!{
        didSet{
            bindRecipeDetails()
        }
    }
    var similarRecipe: [Result]!{
        didSet{
            bindSimilarRecipes()
        }
    }
    init( network: NetworkProtocol!) {
        self.network = network
    }
    func getRecipeDetails(id: Int){
        let parameter = ["id":"\(id)"]
        network.getRecipeData(path: "get-more-info", parameters: parameter) {[weak self] result in
            self?.recipeDetails = result
        }
    }
    func getSimilarRecipe(id: Int){
        let parameter = ["recipe_id":"\(id)"]
        network.getData(path: "list-similarities", parameters: parameter) {[weak self] myResponse in
            self?.similarRecipe = myResponse?.results
        }
    }
    
}
