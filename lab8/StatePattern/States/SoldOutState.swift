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
        print("You can't insert a quarter, the machine is sold out")
    }
    
    func ejectQuarter() {
        if self.delegate!.insertedQuarters > 0 {
            while self.delegate!.insertedQuarters > 0 {
                self.delegate!.insertedQuarters -= 1
//                print("Quarter returned", to: &self.delegate.output)
                print("Quarter returned")
            }
        } else {
            print("You can't eject, you haven't inserted a quarter yet")
        }
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
