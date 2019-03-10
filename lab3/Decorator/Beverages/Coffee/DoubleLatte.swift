//
//  DoubleLatte.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class DoubleLatte: Coffee {
    init() {
        super.init(description: "Double Latte")
    }
    
    private var doubleLatteCost = 130.0
    
    override func getCost() -> Double {
        return self.doubleLatteCost
    }
}
