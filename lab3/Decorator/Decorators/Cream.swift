//
//  Cream.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Cream: CondimentDecorator {
    
    private var cost = 25.0
    
    override func getCost() -> Double {
        return super.getCost() + self.cost
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", Cream"
    }
    
}
