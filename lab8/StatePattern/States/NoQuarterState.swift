//
//  NoQuarterState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class NoQuarterState: State {
    
    private var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        print("You inserted a quarter")
        self.delegate?.setHasQuarterState()
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        print("You turned but there's no quarter")
    }
    
    func dispense() {
        print("You need to pay first")
    }
    
    func toString() -> String {
        return "waiting for quarter"
    }
    
}
