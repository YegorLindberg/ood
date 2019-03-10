//
//  AverageMilkshake.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class AverageMilkshake: Milkshake {
    private let cost = 60.0
    
    init() {
        super.init(description: "Average milkshake")
    }
    
    override func getCost() -> Double {
        return self.cost
    }
}

