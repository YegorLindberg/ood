//
//  Coffee.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Coffee: BeverageUnit {
    override init(description: String = "Coffee") {
        super.init(description: description)
    }
    
    private var coffeeCost = 60.0
    
    override func getCost() -> Double {
        return self.coffeeCost
    }
}
