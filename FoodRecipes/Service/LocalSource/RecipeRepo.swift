//
//  DatabaseProtocol.swift
//  FoodRecipes
//
//  Created by Alaa on 26/05/2023.
//

import Foundation
import CoreData
import UIKit

class RecipeRepo : LocalDataSource {
    
    static let instance = RecipeRepo()
    private let entityName = CoreDataConstants.RECIPE_ENTITY_NAME
    private var contextManager : NSManagedObjectContext!
    private var itemsMOList : [NSManagedObject] = []
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        contextManager = appDelegate.persistentContainer.viewContext
    }
    
    func loadDataFromDB() -> [FavoriteItemModel] {
        let fetch = NSFetchRequest<NSManagedObject>(entityName: entityName)
        var items = [FavoriteItemModel]()
    
        do {
            itemsMOList = try contextManager.fetch(fetch)
            
            for item in itemsMOList{
                items.append(mapItemMOToRecipeEntity(item:  item))
            }
            
        } catch let error{
            print("Error when fetch all data : \(error.localizedDescription)")
        }
        
        return items
        
    }
    
    func insertItemToDatabase(item: Result) {
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: contextManager)
        
        let itemEntity = NSManagedObject(entity: entity!, insertInto: contextManager)
        
        itemEntity.setValue(item.id, forKey: CoreDataConstants.RECIPE_Id)
        itemEntity.setValue(item.credits?[0].name, forKey: CoreDataConstants.RECIPE_Chef)
        itemEntity.setValue(item.slug, forKey: CoreDataConstants.RECIPE_Name)
        itemEntity.setValue(item.numServings, forKey: CoreDataConstants.RECIPE_Servings)
        itemEntity.setValue(item.yields, forKey: CoreDataConstants.RECIPE_Type)
        itemEntity.setValue(item.thumbnailUrl, forKey: CoreDataConstants.RECIPE_Image)
        
        
        do{
            try contextManager.save()
          print("The Items \(String(describing: item.name)) with id \(String(describing: item.id)) added to fav successfully .")
        }catch let e{
            print("Error when add item to fav  : \(e.localizedDescription)")
        }
    }
    
    func removeItemFromDatabase(id: Int) {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        fetch.predicate = NSPredicate(format: "\(CoreDataConstants.RECIPE_Id) == %d", id)
        
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
    
    func isItemInFav(id : Int) -> Bool {
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetch.predicate = NSPredicate(format: "\(CoreDataConstants.RECIPE_Id) == %d", id)
        
        do {
            let fetchResults = try contextManager.fetch(fetch) as? [NSManagedObject]
            if (fetchResults?.first) != nil {
                return true
            }
            
        }catch _ {
            return false
        }
        
        return false
    }
}
extension RecipeRepo{
    
    func mapItemMOToRecipeEntity(item : NSManagedObject) -> FavoriteItemModel {
        let recipeId = item.value(forKey: CoreDataConstants.RECIPE_Id) as? Int
        let recipeServings = item.value(forKey: CoreDataConstants.RECIPE_Servings) as? Int
        let recipeChef = item.value(forKey: CoreDataConstants.RECIPE_Chef) as? String
        let recipeName = item.value(forKey: CoreDataConstants.RECIPE_Name) as? String
        let recipeType = item.value(forKey: CoreDataConstants.RECIPE_Type) as? String
        let recipeImage = item.value(forKey: CoreDataConstants.RECIPE_Image) as? String
        let item = FavoriteItemModel(recipeId: recipeId, recipeServings: recipeServings, recipeChef: recipeChef, recipeName: recipeName, recipeType: recipeType, recipeImage: recipeImage)
        
        return item
    }
    
    
}

