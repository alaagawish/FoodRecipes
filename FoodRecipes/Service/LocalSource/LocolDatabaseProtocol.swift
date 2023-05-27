//
//  LocolDatabaseProtocol.swift
//  FoodRecipes
//
//  Created by Mac on 26/05/2023.
//

import Foundation
protocol LocalDataSource {
    
    func insertItemToDatabase(item: Result)
    func removeItemFromDatabase(id : Int)
    func loadDataFromDB() -> [Result]
    func deleteAllData()
}
