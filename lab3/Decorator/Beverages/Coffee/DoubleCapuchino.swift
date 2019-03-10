//
//  DoubleCapuchino.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class DoubleCapuchino: Coffee {
    init() {
        super.init(description: "Double Capuchino")
    }
    
    private var capuchinoCost = 120.0
    
    override func getCost() -> Double {
        return self.capuchinoCost
    }
}
