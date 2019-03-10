//
//  ChocolateCrumbs.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class ChocolateCrumbs: CondimentDecorator {
    private var mass: UInt = 1
    private let maxMass: UInt = 50
    private let cost = 2.0
    
    init(beverage: Beverage, mass: UInt) {
        self.mass = (mass < 1 || mass > 50) ? self.mass : mass
        super.init(beverage: beverage)
    }
    
    override func getCost() -> Double {
        return super.getCost() + self.cost * Double(self.mass)
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", Chocolate crumbs \(self.mass)g"
    }
    
}
