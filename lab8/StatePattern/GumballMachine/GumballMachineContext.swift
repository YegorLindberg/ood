//
//  GumballMachineContext.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 10/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class GumballMachineContext: GumballMachine {
    
    var ballsCount: UInt = 0
    private(set) var currentState: State?
    var insertedQuarters: UInt = 0
    let maxQuartersCount: UInt = 5
    
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
    
    
    deinit {
        print("deiniting gumball machine context")
    }
}
