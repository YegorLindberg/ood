//
//  HasQuarterState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class HasQuarterState: State {
    
    private var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        print("You can't insert another quarter")
    }
    
    func ejectQuarter() {
        print("Quarter returned")
        self.delegate?.setNoQuarterState()
    }
    
    func turnCrank() {
        print("You turned...")
        self.delegate?.setSoldState()
    }
    
    func dispense() {
        print("No gumball dispensed")
    }
    
    func toString() -> String {
        return "waiting for turn of crank"
    }
    
}
