//
//  DatabaseProtocol.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
import CoreData
import UIKit

class CoreDataLocalDataSource : LocalDataSource {
    
    
    
    static let instance = CoreDataLocalDataSource()
    
    private let entityName = "RecipeItemEntity"
    private var contextManager : NSManagedObjectContext!
    private var itemsNS : [NSManagedObject] = []
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        contextManager = appDelegate.persistentContainer.viewContext
    }
    
    

    func loadDataFromDB() -> [Any] {
        
        
        
        let fetch = NSFetchRequest<NSManagedObject>(entityName: entityName)
        
        var items = [Any]()
        
        do{
            itemsNS = try contextManager.fetch(fetch)
            
            for item in itemsNS{
                let recipeId = item.value(forKey: CoreDataConstants.RECIPE_Id) as? Int
                let recipeServings = item.value(forKey: "recipeServings") as? Int
                let recipeChef = item.value(forKey: "recipeChef") as? String
                let recipeName = item.value(forKey: "recipeName") as? String
                let recipeType = item.value(forKey: "recipeType") as? String
                let recipeImage = item.value(forKey: "recipeImage") as? String
                
                items.append(item)
            }
       
        }catch let error{
            print("Error when fetch all data : \(error.localizedDescription)")
        }
       
       return items
    
    }
    
    
    
    func insertItemToDatabase(item: Any) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: contextManager)
        
        let itemEntity = NSManagedObject(entity: entity!, insertInto: contextManager)
        
        itemEntity.setValue(item.recipeId, forKey: CoreDataConstants.RECIPE_Id)
        itemEntity.setValue(item.recipeChef, forKey: CoreDataConstants.RECIPE_Chef)
        itemEntity.setValue(item.recipeName, forKey: CoreDataConstants.RECIPE_Name)
        itemEntity.setValue(item.recipeServings, forKey: CoreDataConstants.RECIPE_Servings)
        itemEntity.setValue(item.recipeType, forKey: CoreDataConstants.RECIPE_Type)
        itemEntity.setValue(item.recipeImage, forKey: CoreDataConstants.RECIPE_Image)
        
        
        do{
            try contextManager.save()
            print("The Items with id \(item.league_key!) added to fav successfully .")
        }catch let e{
            print("Error when add item to fav  : \(e.localizedDescription)")
        }
    }
    
    
    func removeItemFromDatabase(id: Int) {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        fetch.predicate = NSPredicate(format: "recipe_id == %d", id)
        
        do {
            let fetchResults = try contextManager.fetch(fetch) as? [NSManagedObject]
            if let item = fetchResults?.first {
                contextManager.delete(item)
                try contextManager.save()
                print("Item with id \(id) deleted successfully")
            }
        } catch let error {
            print("Error deleting Item with id \(id): \(error.localizedDescription)")
        }
        
    }
    
    func deleteAllData() {
        
        let fetcht = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetcht)
        
        do {
            try contextManager.execute(deleteRequest)
            print("All data deleted successfully.")
        } catch {
            print("Error deleting data: \(error)")
        }
    }
    
    
}
