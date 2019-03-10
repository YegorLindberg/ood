//
//  LargeMilkshake.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class LargeMilkshake: Milkshake {
    private let cost = 80.0
    
    init() {
        super.init(description: "Large milkshake")
    }
    
    override func getCost() -> Double {
        return self.cost
    }
    
}
