//
//  StatePatternTests.swift
//  StatePatternTests
//
//  Created by Yegor Lindberg on 10/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import XCTest
@testable import StatePattern

class StatePatternTests: XCTestCase {
    let gmContext = GumballMachineContext()
    
    func testSoldState() {
        self.gmContext.setSoldState()
        
        self.gmContext.currentState?.insertQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "Please wait, we're already giving you a gumball")
        
        self.gmContext.currentState?.ejectQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "Sorry you already turned the crank")
        
        self.gmContext.currentState?.turnCrank()
        XCTAssert(self.gmContext.logger.logs.last == "Wait for your gumball")
        
        self.gmContext.ballsCount = 0
        self.gmContext.currentState?.dispense()
        XCTAssert(self.gmContext.logger.logs.last == "Oops, out of gumballs")
        XCTAssert(self.gmContext.currentState is SoldOutState)
        self.gmContext.setSoldState()
        
        self.gmContext.ballsCount = 4
        self.gmContext.releaseBall()
        XCTAssert(self.gmContext.ballsCount == 3)
        XCTAssert(self.gmContext.logger.logs.last == "A gumball comes rolling out the slot...")

        self.gmContext.insertedQuarters = 2
        self.gmContext.currentState?.dispense()
        XCTAssert(self.gmContext.currentState is HasQuarterState)
        self.gmContext.setSoldState()
        
        self.gmContext.insertedQuarters = 0
        self.gmContext.currentState?.dispense()
        XCTAssert(self.gmContext.currentState is NoQuarterState)
    }
    
    func testSoldOutState() {
        self.gmContext.setSoldOutState()
        
        self.gmContext.currentState?.insertQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "You can't insert a quarter, the machine is sold out")
        
        self.gmContext.insertedQuarters = 2
        self.gmContext.currentState?.ejectQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "Quarter returned")
        XCTAssert(self.gmContext.logger.logs[self.gmContext.logger.logs.count - 2] == "Quarter returned")
        
        self.gmContext.currentState?.ejectQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "You can't eject, you haven't inserted a quarter yet")
        
        self.gmContext.currentState?.turnCrank()
        XCTAssert(self.gmContext.logger.logs.last == "You turned but there's no gumballs")
        
        self.gmContext.currentState?.dispense()
        XCTAssert(self.gmContext.logger.logs.last == "No gumball dispensed")
    }
    
    func testHasQuarterState() {
        self.gmContext.insertedQuarters = 1
        self.gmContext.setHasQuarterState()
        
        for _ in 1...4 {
            self.gmContext.currentState?.insertQuarter()
            XCTAssert(self.gmContext.logger.logs.last == "You inserted a quarter")
        }
        
        self.gmContext.currentState?.insertQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "You can no longer insert a quarter")
        
        self.gmContext.currentState?.turnCrank()
        XCTAssert(self.gmContext.currentState is SoldState)
        XCTAssert(self.gmContext.logger.logs.last == "You turned...")
        self.gmContext.setHasQuarterState()
        
        self.gmContext.currentState?.ejectQuarter()
        for i in 1...4 {
            XCTAssert(self.gmContext.logger.logs[self.gmContext.logger.logs.count - i] == "Quarter returned")
        }
        XCTAssert(self.gmContext.currentState is NoQuarterState)
        self.gmContext.insertedQuarters = 1
        self.gmContext.setHasQuarterState()
        
        self.gmContext.currentState?.dispense()
        XCTAssert(self.gmContext.logger.logs.last == "No gumball dispensed")
    }
    
    func testNoQuarterState() {
        self.gmContext.insertedQuarters = 0
        self.gmContext.setNoQuarterState()
        
        self.gmContext.currentState?.insertQuarter()
        XCTAssert(self.gmContext.insertedQuarters == 1)
        XCTAssert(self.gmContext.logger.logs.last == "You inserted a quarter")
        XCTAssert(self.gmContext.currentState is HasQuarterState)
        self.gmContext.insertedQuarters = 0
        self.gmContext.setNoQuarterState()
        
        self.gmContext.currentState?.ejectQuarter()
        XCTAssert(self.gmContext.logger.logs.last == "You haven't inserted a quarter")
        
        self.gmContext.currentState?.turnCrank()
        XCTAssert(self.gmContext.logger.logs.last == "You turned but there's no quarter")
        
        self.gmContext.currentState?.dispense()
        XCTAssert(self.gmContext.logger.logs.last == "You need to pay first")
    }
}
