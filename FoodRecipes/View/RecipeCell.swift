//
//  recipeCell.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var gradImage: UIImageView!
    @IBOutlet weak var RecipeImage: UIImageView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var FavIconButton: UIButton!
    @IBOutlet weak var ChefNameLabel: UILabel!
    @IBOutlet weak var RecipeNameLabel: UILabel!
    @IBOutlet weak var FoodTypeLabel: UILabel!
  var item: Result!
    var bindResultToView : ()->() = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bindResultToView = {}
        ViewUtilities.setCornerRadius(view: FavIconButton, radius: 3.2)
        ViewUtilities.setCornerRadius(view: RecipeImage, radius: 10)
        ViewUtilities.setCornerRadius(view: gradImage, radius: 10)
        FavIconButton.setTitle("", for: .normal)
        // Initializion code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(item : Result!) {
      self.item = item
        self.ChefNameLabel.text = "by " + (item.credits?[0].name ?? "")
        self.RecipeNameLabel.text = item.slug?.replacingOccurrences(of: "-", with: " ")
        self.servingsLabel.text = "\(item.numServings ?? 0)"
        self.FoodTypeLabel.text = item?.show?.name
        ViewUtilities.downloadImageUsingKF(withUrl: item?.thumbnailUrl ?? "", andPlaceholder: CoreDataConstants.RECIPE_Placeholder, inSize: CGSize(width: self.bounds.width - 5, height:  self.bounds.height - 5), showIn: self.RecipeImage)
        
    }
    
    
    @IBAction func btnFavAction(_ sender: Any) {
        
        self.bindResultToView()
 
    }
    
    func setFavUI(isFav:Bool){
        var image:UIImage!
        if isFav{
             image = UIImage(named: FavIcon)
             FavIconButton.setImage(image, for: .normal)
            
        }else{
             image = UIImage(named: notFavIcon)
             FavIconButton.setImage(image, for: .normal)
        }
       
    }



}
