//
//  Capuchino.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Capuchino: Coffee {
    init() {
        super.init(description: "Capuchino")
    }
    
    private var capuchinoCost = 80.0
    
    override func getCost() -> Double {
        return self.capuchinoCost
    }
}
