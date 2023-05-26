//
//  recipeCell.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import UIKit

class recipeCell: UITableViewCell {
    @IBOutlet weak var imgRecipe: UIImageView!
    
    @IBOutlet weak var lblServings: UILabel!
    @IBOutlet weak var btnFavIcon: UIButton!
    @IBOutlet weak var lblChefName: UILabel!
    @IBOutlet weak var lblRecipeName: UILabel!
    
    @IBOutlet weak var lblFoodType: UILabel!
    
    var isFav = false
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewUtilities.setCornerRadius(view: btnFavIcon, radius: 3.2)
        // Initializion code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnFavAction(_ sender: Any) {
        if isFav{
            if let image = UIImage(named: "fillFavIcon") {
                btnFavIcon.setImage(image, for: .normal)
            }
        }else{
            if let image = UIImage(named: "favicon") {
                btnFavIcon.setImage(image, for: .normal)
            }
        }
        isFav.toggle()
        
    }
}
