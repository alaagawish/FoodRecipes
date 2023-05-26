//
//  NetworkTests.swift
//  FoodRecipesTests
//
//  Created by Alaa on 26/05/2023.
//

import XCTest
@testable import FoodRecipes
final class NetworkTests: XCTestCase {
    var network: NetworkProtocol!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        network = Network()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        network = nil
    }

    func testGetData(){
        let parameters = ["recipe_id": "4836"]
        let myExpectation = expectation(description: "network")
        network.getData(path: "list-similarities", parameters: parameters) { result in
          //  print(result)
            guard result != nil else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertNotNil(result?.results)
            myExpectation.fulfill()
            
        }
        waitForExpectations(timeout: 10)
    }

}
