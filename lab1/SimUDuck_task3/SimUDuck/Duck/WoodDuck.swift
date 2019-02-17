//
//  WoodDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class WoodDuck: Duck {
    
    override init() {
        super.init()
        
        self.dancing = danceNoWay
        
        self.quacking = muteQuack
        
        self.flying = flyNoWay()
    }
    
    override func display() {
        print("display wood duck")
    }
}
