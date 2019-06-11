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
        self.delegate?.logger.addLog("Please wait, we're already giving you a gumball")
        print("Please wait, we're already giving you a gumball")
    }
    
    func ejectQuarter() {
        self.delegate?.logger.addLog("Sorry you already turned the crank")
        print("Sorry you already turned the crank")
    }
    
    func turnCrank() {
        self.delegate?.logger.addLog("Wait for your gumball")
        print("Wait for your gumball")
    }
    
    func dispense() {
        self.delegate?.releaseBall()
        if self.delegate?.ballsCount == 0 {
            self.delegate?.logger.addLog("Oops, out of gumballs")
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
