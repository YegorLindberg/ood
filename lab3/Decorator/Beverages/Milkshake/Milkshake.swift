//
//  Milkshake.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Milkshake: BeverageUnit {
    override init(description: String = "Milkshake") {
        super.init(description: description)
    }
    
    private var milkshakeCost = 80.0
    
    override func getCost() -> Double {
        return self.milkshakeCost
    }
}
