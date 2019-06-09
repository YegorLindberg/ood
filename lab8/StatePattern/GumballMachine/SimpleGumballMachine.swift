//
//  SimpleGumballMachine.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SimpleGumballMachine: GumballMachine {
    
    private(set) var ballsCount: UInt = 0
    private(set) var currentState: State?
    
    init(ballsCount: UInt) {
        self.ballsCount = ballsCount
        if ballsCount > 0 {
            self.setNoQuarterState()
        } else {
            self.setSoldOutState()
        }
    }
    
    func ejectQuarter() {
        self.currentState?.ejectQuarter()
    }
    
    func insertQuarter() {
        self.currentState?.insertQuarter()
    }
    
    func turnCrank() {
        self.currentState?.turnCrank()
        self.currentState?.dispense()
    }
    
    func toString() -> String {
        return """
Mighty Gumball, Inc.
Swift-enabled Standing Gumball Model #2016 (with state)
Inventory: \(self.ballsCount) gumball\(self.ballsCount != 1 ? "s" : "")
Machine is \(self.currentState?.toString() ?? "not found")
"""
    }
    
    func releaseBall() {
        if self.ballsCount != 0 {
            print("A gumball comes rolling out the slot...")
            self.ballsCount -= 1
        }
    }
    
    func setSoldOutState() {
        self.currentState = SoldOutState(self)
    }
    
    func setNoQuarterState() {
        self.currentState = NoQuarterState(self)
    }
    
    func setSoldState() {
        self.currentState = SoldState(self)
    }
    
    func setHasQuarterState() {
        self.currentState = HasQuarterState(self)
    }
    
}
