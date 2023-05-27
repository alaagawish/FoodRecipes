//
//  LaunchScreenViewController.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            
            let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
            let nav = storyboard.instantiateViewController(withIdentifier: home) 
             nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
    
}
