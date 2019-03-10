//
//  Chocolate.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Chocolate: CondimentDecorator {
    private var slice: UInt = 1
    private let maxMass: UInt = 5
    private let cost = 10.0
    
    init(beverage: Beverage, slice: UInt) {
        self.slice = (slice >= 1 && slice <= 5) ? slice : self.slice
        super.init(beverage: beverage)
    }
    
    override func getCost() -> Double {
        return super.getCost() + self.cost * Double(self.slice)
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", Chocolate slices: \(self.slice)"
    }
    
}
