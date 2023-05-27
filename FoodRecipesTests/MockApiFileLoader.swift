//
//  MockApiFileLoader.swift
//  FoodRecipesTests
//
//  Created by Alaa on 27/05/2023.
//

import Foundation
@testable import FoodRecipes
class MockApiFileLoader {
    
    func loadApiFiles() -> MyResponse? {
        //        let paths = Bundle.main.paths(forResourcesOfType: "json", inDirectory: "")
        //        let mockPath = paths.filter { $0.components(separatedBy: "/").last?.hasPrefix("Mock-response") == true }.first
        //        guard let mockPath = mockPath else { return nil }
        //        return generateModel(for: mockPath)
        
        let bundle = Bundle(for: type(of: self))
        let fileUrl = bundle.url(forResource: "Mock-response", withExtension: "json")
        do {
            let data = try Data(contentsOf: fileUrl!)
            let response = try JSONDecoder().decode(MyResponse.self, from: data)
            return response
        } catch {
            return nil
        }
    }
    
    private func generateModel(for path: String) -> MyResponse? {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
              let mockyJSON = try? JSONDecoder().decode(MyResponse.self, from: data)
        else { return nil }
        return mockyJSON
    }
    
}
