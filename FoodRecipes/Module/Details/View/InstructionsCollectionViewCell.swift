//
//  InstructionsCollectionViewCell.swift
//  FoodRecipes
//
//  Created by Alaa on 27/05/2023.
//

import UIKit

class InstructionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pointImage: UIImageView!
    
    @IBOutlet weak var instructionLabel: UILabel!
    func changeSize(){
        pointImage.contentMode = .scaleAspectFill
        
        pointImage.layer.cornerRadius =   pointImage.frame.size.height / 2
        pointImage.layer.masksToBounds = true
    }
    
    func setDetails(instruction: String){
        changeSize()
        instructionLabel.text = instruction
    }
    
}
