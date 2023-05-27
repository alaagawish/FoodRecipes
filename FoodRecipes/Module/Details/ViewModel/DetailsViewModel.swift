//
//  DetailsViewModel.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import Foundation

class DetailsViewModel{
    
    var bindRecipeDetails: (()->()) = {}
    var recipeDetails: [Credit]!{
        didSet{
            bindRecipeDetails()
        }
    }
    
    func getRecipeDetails(){
        
    }
    
}
