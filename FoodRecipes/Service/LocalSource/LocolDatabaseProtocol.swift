//
//  LocolDatabaseProtocol.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import Foundation
protocol LocalDataSource {
    
    func insertItemToDatabase(item: Any)
    func removeItemFromDatabase(id : Int)
    func loadDataFromDB() -> [Any]
    func deleteAllData()
}
