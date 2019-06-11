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
            self.delegate?.logger.addLog("You inserted a quarter")
            print("You inserted a quarter")
        } else {
            self.delegate?.logger.addLog("You can no longer insert a quarter")
            print("You can no longer insert a quarter")
        }
    }
    
    func ejectQuarter() {
        while self.delegate!.insertedQuarters > 0 {
            self.delegate?.insertedQuarters -= 1
            self.delegate?.logger.addLog("Quarter returned")
            print("Quarter returned")
        }
        self.delegate?.setNoQuarterState()
    }
    
    func turnCrank() {
        self.delegate?.insertedQuarters -= 1
        self.delegate?.setSoldState()
        self.delegate?.logger.addLog("You turned...")
        print("You turned...")
    }
    
    func dispense() {
        self.delegate?.logger.addLog("No gumball dispensed")
        print("No gumball dispensed")
    }
    
    func toString() -> String {
        return "waiting for turn of crank"
    }
    
}
