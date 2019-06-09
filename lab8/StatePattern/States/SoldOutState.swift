//
//  SoldOutState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SoldOutState: State {
    
    private var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        print("You can't insert a quarter, the machine is sold out")
    }
    
    func ejectQuarter() {
        print("You can't eject, you haven't inserted a quarter yet")
    }
    
    func turnCrank() {
        print("You turned but there's no gumballs")
    }
    
    func dispense() {
        print("No gumball dispensed")
    }
    
    func toString() -> String {
        return "sold out"
    }
    
    
}
