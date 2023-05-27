//
//  FavViewModel.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import Foundation

class FavouriteViewModel{
    
    var bindResultToView : (()->()) = {}
    
    var allFavRecipes : [FavoriteItemModel] = [] {
        didSet{
            DispatchQueue.main.async {
                self.bindResultToView()
            }
        }
    }
    
    var databaseInstance : LocalDataSource
    
    init(databaseInstance: RecipeRepo) {
        
        self.databaseInstance = databaseInstance
    }
    
    func loadCachingData(){
        
        self.allFavRecipes = databaseInstance.loadDataFromDB()
    }
    
    func deleteFavItem(itemKey : Int){
        
        self.databaseInstance.removeItemFromDatabase(id: itemKey)
        self.loadCachingData()
    }
    
    
    func checkInternetConnectivity()->Bool{
        
        return Connectivity.sharedInstance.isConnectedToInternet()
    }
    
    
}
