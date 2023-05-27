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
            self.performSegue(withIdentifier: home, sender: nil)
        }
    }
    
}
