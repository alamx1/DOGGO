//
//  DOGGOTests.swift
//  DOGGOTests
//
//  Created by michelle natasha on 10/19/19.
//  Copyright © 2019 DOGGO. All rights reserved.
//

import XCTest
@testable import DOGGO

class DOGGOTests: XCTestCase {
    override func setUp() {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }

       func testExample() {
           // This is an example of a functional test case.
           // Use XCTAssert and related functions to verify your tests produce the correct results.
       }

       func testPerformanceExample() {
           // This is an example of a performance test case.
           self.measure {
               // Put the code you want to measure the time of here.
           }
       }
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testPetInitializationSucceeds() {
        // Rating exceeds maximum
        let success = Pet.init(name: "Large", photo: nil)
        XCTAssertNil(success)
        
        // Empty String
        let emptyString = Pet.init(name: "", photo: nil)
        XCTAssertNil(emptyString)
    }

}
