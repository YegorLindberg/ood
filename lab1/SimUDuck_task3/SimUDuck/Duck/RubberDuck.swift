//
//  RubberDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class RubberDuck: Duck {
    
    override init() {
        super.init()
        
        self.dancing = danceNoWay
        
        self.quacking = squeak
        
        self.flying = flyNoWay()
    }
    
    override func display() {
        print("display rubber duck")
    }
}
