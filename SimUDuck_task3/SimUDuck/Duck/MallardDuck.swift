//
//  MallardDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class MullardDuck: Duck {

    override init() {
        super.init()
        
        self.dancing = danceWaltz
        
        self.quacking = usualQuacking
        
        self.flying = doFly()
    }

    override func display() {
        print("display mullard duck")
    }
}
