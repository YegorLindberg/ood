//
//  SoldState.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SoldState: State {
    
    private weak var delegate: GumballMachine?
    
    init(_ gumballMachine: GumballMachine) {
        self.delegate = gumballMachine
    }
    
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball")
    }
    
    func ejectQuarter() {
        print("Sorry you already turned the crank")
    }
    
    func turnCrank() {
        print("Wait for your gumball")
    }
    
    func dispense() {
        self.delegate?.releaseBall()
        if self.delegate?.ballsCount == 0 {
            print("Oops, out of gumballs")
            self.delegate?.setSoldOutState()
        } else {
            guard let insertedCoins = self.delegate?.insertedQuarters else { return }
            if insertedCoins > UInt(0) {
                self.delegate?.setHasQuarterState()
            } else {
                self.delegate?.setNoQuarterState()
            }
        }
    }
    
    func toString() -> String {
        return "delivering a gumball"
    }
    
}
