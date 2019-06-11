//
//  SimpleGumballMachine.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SimpleGumballMachine {

    private var context = GumballMachineContext()

    init(ballsCount: UInt) {
        self.context.ballsCount = ballsCount
        if ballsCount > 0 {
            self.context.setNoQuarterState()
        } else {
            self.context.setSoldOutState()
        }
    }
    
    func ejectQuarter() {
        self.context.currentState?.ejectQuarter()
    }
    
    func insertQuarter() {
        self.context.currentState?.insertQuarter()
    }
    
    func turnCrank() {
        self.context.currentState?.turnCrank()
        self.context.currentState?.dispense()
    }
    
    func toString() -> String {
        return """
        Mighty Gumball, Inc.
        Swift-enabled Standing Gumball Model #2016 (with state)
        Inventory: \(self.context.ballsCount ?? 0) gumball\(self.context.ballsCount != 1 ? "s" : "")
        Machine is \(self.context.currentState?.toString() ?? "not found")
        """
    }
    
}

