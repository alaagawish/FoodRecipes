//
//  HomeViewMode.swift
//  FoodRecipes
//
//  Created by Hossam on 26/05/2023.
//

import Foundation
class HomeViewModel{
  var bindResultToViewController: (()->()) = {}
  var myNetwork: Network!

  var result: [Result]? = [] {
    didSet{
      bindResultToViewController()
    }
  }

  func getItems(categoryName: String){

    let path = "list"
    let parameters = ["from" : "0", "size" : "20", "tags" : categoryName]

    myNetwork = Network()
    myNetwork.getData(path: path, parameters: parameters){ [weak self] (response : MyResponse?) in

      self?.result = response?.results

    }
  }
}
