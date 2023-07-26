//
//  IngredientTableViewCell.swift
//  FoodRecipes
//
//  Created by Alaa on 26/07/2023.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var componentLabel: UILabel!
    
    @IBOutlet weak var pointImg: UIImageView!
    
    @IBOutlet weak var componentDetailLabel: UILabel!
    
    func changeSize(){
        pointImg.contentMode = .scaleAspectFill
        
        pointImg.layer.cornerRadius =   pointImg.frame.size.height / 2
        pointImg.layer.masksToBounds = true
    }
    func setDetails(component: String, componentDetail: String){
        changeSize()
        componentLabel.text = component
        componentDetailLabel.text = componentDetail
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
