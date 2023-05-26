//
//  ViewUtilities.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import Foundation
import UIKit

class ViewUtilities {
    
    static func setCornerRadius(view : UIView , radius: Float){
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius =   view.frame.size.height / CGFloat(radius)
            view.layer.masksToBounds = true
    }
    
    
    
}
