//
//  RubberDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class RubberDuck: CDuck {
    
    override init() {
        super.init()
        setFlying(type: CFlyNoWay())
        setQuacking(type: CSqueak())
        setDancing(type: CDanceNoWay())
    }
    
    override func display() {
        print("display rubber duck")
    }
    
}
