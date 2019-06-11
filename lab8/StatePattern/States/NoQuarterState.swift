//
//  NoQuarterState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class NoQuarterState: State {
    
    private weak var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        self.delegate?.insertedQuarters += 1
        self.delegate?.logger.addLog("You inserted a quarter")
        print("You inserted a quarter")
        self.delegate?.setHasQuarterState()
    }
    
    func ejectQuarter() {
        self.delegate?.logger.addLog("You haven't inserted a quarter")
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        self.delegate?.logger.addLog("You turned but there's no quarter")
        print("You turned but there's no quarter")
    }
    
    func dispense() {
        self.delegate?.logger.addLog("You need to pay first")
        print("You need to pay first")
    }
    
    func toString() -> String {
        return "waiting for quarter"
    }
    
}
