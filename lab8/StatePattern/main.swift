//
//  main.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

func testGumballMachine() {
    let gumballMachine = SimpleGumballMachine(ballsCount: 5)
//    let gumballMachine = NaiveGumballMachine(ballsCount: 5)
    
    print(gumballMachine.toString(), "\n")
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    
    print(gumballMachine.toString(), "\n")
    
    
    gumballMachine.insertQuarter()
    gumballMachine.ejectQuarter()
    gumballMachine.turnCrank()
    
    print(gumballMachine.toString(), "\n")
    
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    gumballMachine.ejectQuarter()
    
    print(gumballMachine.toString(), "\n")
    
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    gumballMachine.insertQuarter()
    gumballMachine.turnCrank()
    gumballMachine.ejectQuarter()
    
    print(gumballMachine.toString(), "\n")
    print("---------------------------")
    
}

testGumballMachine()

