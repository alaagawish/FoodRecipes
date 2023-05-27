//
//  IngredientCollectionViewCell.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import UIKit

class IngredientCollectionViewCell: UICollectionViewCell {
    
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
}
