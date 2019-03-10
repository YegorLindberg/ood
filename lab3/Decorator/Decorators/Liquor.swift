//
//  Liquor.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

enum LiquorType: String {
    case Chocolate = "Chocolate"  // Шоколадный
    case Nut = "Nut"              // Ореховый
}

class Liquor: CondimentDecorator {
   
    private var liquorType: LiquorType
    private var cost   = 50.0
    
    init(beverage: Beverage, liquorType: LiquorType) {
        self.liquorType = liquorType
        super.init(beverage: beverage)
    }
    
    override func getCost() -> Double {
        return super.getCost() + self.cost
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", " + self.liquorType.rawValue + " Liquor"
    }

}
