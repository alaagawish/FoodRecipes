//
//  recipeCell.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet weak var RecipeImage: UIImageView!
    
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var FavIconButton: UIButton!
    @IBOutlet weak var ChefNameLabel: UILabel!
    @IBOutlet weak var RecipeNameLabel: UILabel!
    
    @IBOutlet weak var FoodTypeLabel: UILabel!
    
    var isFav = false
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewUtilities.setCornerRadius(view: FavIconButton, radius: 3.2)
        // Initializion code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnFavAction(_ sender: Any) {
        var image:UIImage!
        if isFav{
             image = UIImage(named: "fillFavIcon")
             FavIconButton.setImage(image, for: .normal)
            
        }else{
             image = UIImage(named: "favicon")
             FavIconButton.setImage(image, for: .normal)
            
        }
        isFav.toggle()
        
    }
}
