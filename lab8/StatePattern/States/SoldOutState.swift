//
//  SoldOutState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SoldOutState: State {
    
    private weak var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        self.delegate?.logger.addLog("You can't insert a quarter, the machine is sold out")
        print("You can't insert a quarter, the machine is sold out")
    }
    
    func ejectQuarter() {
        if self.delegate!.insertedQuarters > 0 {
            while self.delegate!.insertedQuarters > 0 {
                self.delegate!.insertedQuarters -= 1
                self.delegate?.logger.addLog("Quarter returned")
                print("Quarter returned")
            }
        } else {
            self.delegate?.logger.addLog("You can't eject, you haven't inserted a quarter yet")
            print("You can't eject, you haven't inserted a quarter yet")
        }
    }
    
    func turnCrank() {
        self.delegate?.logger.addLog("You turned but there's no gumballs")
        print("You turned but there's no gumballs")
    }
    
    func dispense() {
        self.delegate?.logger.addLog("No gumball dispensed")
        print("No gumball dispensed")
    }
    
    func toString() -> String {
        return "sold out"
    }
    
    
}
