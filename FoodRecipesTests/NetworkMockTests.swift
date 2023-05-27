//
//  NetworkMockTests.swift
//  FoodRecipesTests
//
//  Created by Alaa on 26/05/2023.
//

import XCTest
@testable import FoodRecipes
final class NetworkMockTests: XCTestCase {
    var netorkMock: NetworkProtocol!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        netorkMock = NetworkMock(isSuccess: true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        netorkMock = nil
    }
    func testNetworkFail(){
        netorkMock = NetworkMock(isSuccess: false)
        netorkMock.getData(path: "", parameters: ["":""], handler: { result in
            XCTAssertNil(result)
        })
    
    }
    func testNetworkPass(){
        netorkMock = NetworkMock(isSuccess: true)
        netorkMock.getData(path: "", parameters: ["":""], handler: { result in
            XCTAssertEqual(result?.count,10)
            XCTAssertNotNil(result?.count)
        })
    
    }

  

}
