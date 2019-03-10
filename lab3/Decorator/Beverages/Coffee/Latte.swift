//
//  Latte.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Latte: Coffee {
    init() {
        super.init(description: "Latte")
    }
    
    private var latteCost = 90.0
    
    override func getCost() -> Double {
        return self.latteCost
    }
}
