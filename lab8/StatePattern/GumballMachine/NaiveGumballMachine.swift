//
//  NaiveGumballMachine.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class NaiveGumballMachine {
    
    private var state = State.NoQuarter
    private var ballsCount: UInt = 0
    
    init(ballsCount: UInt) {
        self.ballsCount = ballsCount
        self.state = ballsCount > 0 ? State.NoQuarter : State.SoldOut
    }
    
    enum State: String {
        case SoldOut    = "sold out"        // Жвачка закончилась
        case NoQuarter  = "no quarter"      // Нет монетки
        case HasQuarter = "has quarter"     // Есть монетка
        case Sold       = "sold"            // Монетка выдана
    }
    
    func insertQuarter() {
        switch self.state {
        case .SoldOut:
            print("You can't insert a quarter, the machine is sold out")
        case .NoQuarter:
            print("You inserted a quarter")
            self.state = .HasQuarter
        case .HasQuarter:
            print("You can't insert another quarter")
        case .Sold:
            print("Please wait, we're already giving you a gumball")
        }
    }
    
    func ejectQuarter() {
        switch self.state {
        case .HasQuarter:
            print("Quarter returned")
            self.state = .NoQuarter
        case .NoQuarter:
            print("You haven't inserted a quarter")
        case .Sold:
            print("Sorry you already turned the crank")
        case .SoldOut:
            print("You can't eject, you haven't inserted a quarter yet")
        }
    }
    
    func turnCrank() {
        switch self.state {
        case .SoldOut:
            print("You turned but there's no gumballs")
        case .NoQuarter:
            print("You turned but there's no quarter\n")
        case .HasQuarter:
            print("You turned...\n")
            self.state = .Sold
            self.dispense();
        case .Sold:
            print("Turning twice doesn't get you another gumball")
        }
    }
    
    func refill(ballsCount: UInt) {
        self.ballsCount = ballsCount
        self.state = ballsCount > 0 ? State.NoQuarter : State.SoldOut
    }
    
    func toString() -> String {
        return """
        Mighty Gumball, Inc.
        Swift-enabled Standing Gumball Model #2016 (with state)
        Inventory: \(self.ballsCount) gumball\(self.ballsCount != 1 ? "s" : "")
        Machine is \(self.state.rawValue)
        """
    }
    
    private func dispense() {
        switch self.state {
        case .Sold:
            print("A gumball comes rolling out the slot")
            self.ballsCount -= 1
            if self.ballsCount == 0 {
                print("Oops, out of gumballs")
                self.state = .SoldOut
            } else {
                self.state = .NoQuarter
            }
        case .NoQuarter:
            print("You need to pay first")
        default:
            print("No gumball dispensed")
        }
    }
}
