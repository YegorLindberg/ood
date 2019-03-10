//
//  CondimentDecorator.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class CondimentDecorator: Beverage {
    private var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getDescription() -> String {
        return self.beverage.getDescription()
    }
    
    func getCost() -> Double {
        return self.beverage.getCost()
    }

}
