//
//  RubberDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class RubberDuck: CDuck {
    
    override init() {
        super.init()
        
        self.setDancing(danceNoWay)
        
        self.setQuacking(squeak)
        
        self.setFlying(flyNoWay)
    }
    
    override func display() {
        print("display rubber duck")
    }
}
