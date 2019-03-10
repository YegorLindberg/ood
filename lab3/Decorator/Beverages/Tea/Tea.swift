//
//  Tea.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Tea: BeverageUnit {
    override init(description: String = "Tea") {
        super.init(description: description)
    }
    
    private var teaCost = 30.0
    
    override func getCost() -> Double {
        return self.teaCost
    }
}
