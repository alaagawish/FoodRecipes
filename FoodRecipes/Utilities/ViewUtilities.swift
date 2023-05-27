//
//  ViewUtilities.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import Foundation
import UIKit
import Kingfisher

class ViewUtilities {
    
    static func setCornerRadius(view : UIView , radius: Float){
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius =   view.frame.size.height / CGFloat(radius)
        view.layer.masksToBounds = true
    }
    
    static func downloadImageUsingKF(withUrl: String , andPlaceholder : String , inSize : CGSize , showIn : UIImageView!){
        let imageUrl = URL(string: withUrl)
        
        let processor = DownsamplingImageProcessor(size: inSize ) |> RoundCornerImageProcessor(cornerRadius: 10)
        showIn!.kf.indicatorType = .activity
        
        showIn!.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(named: andPlaceholder)!,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        
        
    }
    
}


enum AlertType {
    
    case noInternet
    case comingSoon
    case confirmRemove(deleteHandler: () -> Void)
    
    
    var title: String {
        
        switch self {
            case .noInternet:
                return "No Internet Connection"
            case .confirmRemove:
                return "Remove from Favorites "
            case .comingSoon:
                return "Coming Soon "
        }
    }
    
    var message: String {
        
        switch self {

        case .noInternet:
            return "No internet connection, Please check your network !"
        case .confirmRemove:
            return "Are you sure you want to remove this item from favorites?"
        case .comingSoon:
            return "This item will be available soon."
        }
    }
    
    func showAlert(in viewController: UIViewController) {
            let alertController = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
            
            switch self {
            case let .confirmRemove(deleteHandler):
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                    deleteHandler()
                }
                alertController.addAction(deleteAction)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                
            default:
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
            }
            
            viewController.present(alertController, animated: true, completion: nil)
        }
}


    
    


