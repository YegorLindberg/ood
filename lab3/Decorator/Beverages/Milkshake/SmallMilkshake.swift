//
//  SmallMilkshake.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SmallMilkshake: Milkshake {
    private let cost = 50.0
    
    init() {
        super.init(description: "Small milkshake")
    }
    
    override func getCost() -> Double {
        return self.cost
    }
}
