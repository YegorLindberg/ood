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
    private var insertedQuarters = 0
    private let maxQuartersCount = 5
    
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
            self.insertedQuarters += 1
            self.state = .HasQuarter
        case .HasQuarter:
            if self.insertedQuarters + 1 <= maxQuartersCount {
                self.insertedQuarters += 1
                print("You inserted a quarter")
            } else {
                print("You can no longer insert a quarter")
            }
        case .Sold:
            print("Please wait, we're already giving you a gumball")
        }
    }
    
    func ejectQuarter() {
        switch self.state {
        case .HasQuarter:
            while self.insertedQuarters > 0 {
                self.insertedQuarters -= 1
                print("Quarter returned")
            }
            self.state = .NoQuarter
        case .NoQuarter:
            print("You haven't inserted a quarter")
        case .Sold:
            print("Sorry you already turned the crank")
        case .SoldOut:
            if self.insertedQuarters > 0 {
                while self.insertedQuarters > 0 {
                    self.insertedQuarters -= 1
                    print("Quarter returned")
                }
            } else {
                print("You can't eject, you haven't inserted a quarter yet")
            }
            self.state = .NoQuarter
        }
    }
    
    func turnCrank() {
        switch self.state {
        case .SoldOut:
            print("You turned but there's no gumballs")
        case .NoQuarter:
            print("You turned but there's no quarter\n")
        case .HasQuarter:
            self.insertedQuarters -= 1
            self.state = .Sold
            print("You turned...")
            self.dispense();
        case .Sold:
            print("Wait for your gumball")
        }
    }
    
    func refill(ballsCount: UInt) {
        self.ballsCount = ballsCount
        self.state = ballsCount > 0 ? State.NoQuarter : State.SoldOut
    }
    
    func toString() -> String {
        return """
        Naive Gumball, Inc.
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
                if self.insertedQuarters > 0 {
                    self.state = .HasQuarter
                } else {
                    self.state = .NoQuarter
                }
            }
        case .NoQuarter:
            print("You need to pay first")
        default:
            print("No gumball dispensed")
        }
    }
}
