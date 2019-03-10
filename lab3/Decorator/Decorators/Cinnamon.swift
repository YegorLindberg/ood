//
//  Cinnamon.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Cinnamon: CondimentDecorator {

    private var cinnamonCost = 20.0

    override func getCost() -> Double {
        return super.getCost() + cinnamonCost
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", Cinnamon"
    }
    
}
