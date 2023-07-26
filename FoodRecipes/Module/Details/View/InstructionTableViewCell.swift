//
//  InstructionTableViewCell.swift
//  FoodRecipes
//
//  Created by Alaa on 26/07/2023.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {

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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
