//
//  HomeViewMode.swift
//  FoodRecipes
//
//  Created by Hossam on 26/05/2023.
//

import Foundation
class HomeViewModel{
  var bindResultToViewController: (()->()) = {}
  var netWorkingDataSource: Network!
  var localDataSource : LocalDataSource
  var allFavRecipes : [FavoriteItemModel]? = [] {
    didSet{
            DispatchQueue.main.async {
                self.bindResultToViewController()
            }
        }
    }
    
  var result: [Result]? = [] {
      didSet{
              DispatchQueue.main.async {
                  self.bindResultToViewController()
            }
    }
  }
    
    init(netWorkingDataSource: Network, locaDataSource : LocalDataSource) {
        self.localDataSource = locaDataSource
        self.netWorkingDataSource = netWorkingDataSource
    }

  func getItems(categoryName: String){

    let path = "list"
    let parameters = ["from" : "0", "size" : "20", "tags" : categoryName]

      netWorkingDataSource.getData(path: path, parameters: parameters){ [weak self] (response : MyResponse?) in

      self?.result = response?.results

    }
  }
    func loadAllFavRecipes(){
        
        self.allFavRecipes = localDataSource.loadDataFromDB()
    }
    
    func addToFav(item: Result){
        
        localDataSource.insertItemToDatabase(item: item)
        
        self.loadAllFavRecipes()
    }
    
    func removeFavItem(id: Int){
        
        localDataSource.removeItemFromDatabase(id: id)
        self.loadAllFavRecipes()
        
    }
    
    func checkIsItemInFav(id: Int)->Bool{
        return localDataSource.isItemInFav(id: id)
    }
    
    
}
