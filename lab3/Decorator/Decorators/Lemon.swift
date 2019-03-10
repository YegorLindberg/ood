//
//  Lemon.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Lemon: CondimentDecorator {
    private var quantity: UInt = 1
    
    private let lemonCost = 10.0
    
    init(beverage: Beverage, quantity: UInt) {
        self.quantity = quantity
        super.init(beverage: beverage)
    }
    
    override func getCost() -> Double {
        return super.getCost() + self.lemonCost * Double(self.quantity)
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", Lemon x \(self.quantity)"
    }
}
