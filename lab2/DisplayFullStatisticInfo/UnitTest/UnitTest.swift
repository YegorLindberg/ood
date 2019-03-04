//
//  UnitTest.swift
//  UnitTest
//
//  Created by Yegor Lindberg on 25/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import XCTest
@testable import DisplayFullStatisticInfo

class UnitTest: XCTestCase {
    
    var weatherStation1 = WeatherData(name: "first")
    var weatherStation2 = WeatherData(name: "second")

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
        
    }
    
    func testCheckMultipleSubjects() {
        
        XCTAssertNotEqual(weatherStation1.identifier, weatherStation2.identifier)
    }
    
    func testCheckObserverPriority() {
        
    }
    
    
}
