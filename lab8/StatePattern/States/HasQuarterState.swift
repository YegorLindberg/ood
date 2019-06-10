//
//  HasQuarterState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class HasQuarterState: State {
    
    private weak var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        guard let insertedCoins = self.delegate?.insertedQuarters else { return }
        if insertedCoins + 1 <= self.delegate!.maxQuartersCount {
            self.delegate?.insertedQuarters += 1
            print("You inserted a quarter")
        } else {
            print("You can no longer insert a quarter")
        }
    }
    
    func ejectQuarter() {
        while self.delegate!.insertedQuarters > 0 {
            self.delegate?.insertedQuarters -= 1
            print("Quarter returned")
        }
        self.delegate?.setNoQuarterState()
    }
    
    func turnCrank() {
        self.delegate?.insertedQuarters -= 1
        self.delegate?.setSoldState()
        print("You turned...")
    }
    
    func dispense() {
        print("No gumball dispensed")
    }
    
    func toString() -> String {
        return "waiting for turn of crank"
    }
    
}
