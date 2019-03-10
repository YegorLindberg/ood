//
//  Syrop.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

enum SyropType: String {
    case Chocolate = "Chocolate"  // Шоколадный
    case Maple = "Maple"          // Кленовыйы
}

class Syrop: CondimentDecorator {
    private var quantity: UInt   = 1
    private var syropType: SyropType
    private var syropCost   = 15.0
    
    init(beverage: Beverage, quantity: UInt, syropType: SyropType) {
        self.syropType = syropType
        self.quantity = quantity
        super.init(beverage: beverage)
    }
    
    override func getCost() -> Double {
        return super.getCost() + self.syropCost * Double(self.quantity)
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", " + self.syropType.rawValue + " Syrop x \(self.quantity)"
    }

}

