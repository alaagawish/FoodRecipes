//
//  SimilarRecipeCollectionViewCell.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import UIKit
import Kingfisher

class SimilarRecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var chefName: UILabel!
    
    @IBOutlet weak var serving: UILabel!
    
    @IBOutlet weak var foodType: UILabel!
    
    @IBOutlet weak var recipeImg: UIImageView!
    
    func setDetails(recipe: Result){
        self.chefName.text = "by " + (recipe.credits?[0].name)!
        self.nameLabel.text = recipe.slug?.replacingOccurrences(of: "-", with: " ")
        self.serving.text = "\(recipe.numServings ?? 0)"
        self.foodType.text = recipe.show?.name
        ViewUtilities.downloadImageUsingKF(withUrl: recipe.thumbnailUrl ?? CoreDataConstants.RECIPE_Placeholder , andPlaceholder: CoreDataConstants.RECIPE_Placeholder , inSize: CGSize(width: 100, height: 100), showIn: recipeImg)
        
       // self.recipeImg.kf.setImage(with: recipe.thumbnailUrl,
//                             placeholder: UIImage(named: "noImg"))
    }
}
