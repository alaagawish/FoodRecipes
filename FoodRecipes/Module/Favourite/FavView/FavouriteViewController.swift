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
    var viewModel: FavouriteViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "recipeCell", bundle: nil)
        FavTableView.register(nib, forCellReuseIdentifier: "recipecell")
        
        FavTableView.dataSource = self
        FavTableView.delegate = self
        
        viewModel = FavouriteViewModel(databaseInstance: CoreDataLocalDataSource.instance)

     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadCachingData()
        viewModel.bindResultToView = { [weak self] in
            
            if self!.viewModel.allFavRecipes.isEmpty
            {
                self?.FavTableView.isHidden = true
                self?.imgNoImage.isHidden = false
              
            }else{
                self?.FavTableView.isHidden = false
                self?.imgNoImage.isHidden = true
                self?.FavTableView.reloadData()
            }
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allFavRecipes.count
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        AlertType.confirmRemove(deleteHandler: {[weak self] in
            if editingStyle == .delete {
                
                self?.viewModel.deleteFavItem(itemKey: self?.viewModel.allFavRecipes[indexPath.row].id ?? 0)
                self?.FavTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }).showAlert(in: self)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipecell", for: indexPath) as! recipeCell
        
        cell.ChefNameLabel.text = viewModel.allFavRecipes[indexPath.row].credits?[0].name
        cell.RecipeNameLabel.text = viewModel.allFavRecipes[indexPath.row].slug
        cell.FoodTypeLabel.text = viewModel.allFavRecipes[indexPath.row].yields
        cell.servingsLabel.text = "\(String(describing: viewModel.allFavRecipes[indexPath.row].numServings))"
        ViewUtilities.downloadImageUsingKF(withUrl: viewModel.allFavRecipes[indexPath.row].thumbnailUrl ?? "", andPlaceholder: CoreDataConstants.RECIPE_Placeholder, inSize: CGSize(width: cell.RecipeImage.bounds.width - 5, height: cell.RecipeImage.bounds.height - 5), showIn: cell.RecipeImage)
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if viewModel.checkInternetConnectivity(){
            //let detilsVc = storyboard?.instantiateViewController(withIdentifier: "cell") as! RecipeDetailsScreen
            
            //self.present(detilsVc, animated: true, completion: nil)
        }else{
            AlertType.noInternet.showAlert(in: self)
        }
        
       
    }
 

}
