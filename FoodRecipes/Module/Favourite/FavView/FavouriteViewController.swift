//
//  FavouriteViewController.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//


import UIKit

class FavoriteViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
    @IBOutlet weak var imgNoImage: UIImageView!
    @IBOutlet weak var FavTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FavTableView.dataSource = self
        FavTableView.delegate = self
        let nib = UINib(nibName: "recipeCell", bundle: nil)
        FavTableView.register(nib, forCellReuseIdentifier: "recipecell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imgNoImage.isHidden = false
        FavTableView.isHidden = true
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipecell", for: indexPath) as! recipeCell
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
