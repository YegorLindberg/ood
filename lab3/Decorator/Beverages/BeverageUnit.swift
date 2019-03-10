//
//  BeverageUnit.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class BeverageUnit: Beverage {
    private var description: String
    
    init(description: String) {
        self.description = description
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func getCost() -> Double {
        return Double()
    }
}
