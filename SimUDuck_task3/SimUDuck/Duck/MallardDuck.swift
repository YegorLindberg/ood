//
//  MallardDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class MullardDuck: CDuck {
    
    override init() {
        super.init()
        
        self.setDancing(danceWaltz)
        
        self.setQuacking(quacking)
        
        self.setFlying(flyWithWings)
    }
    
    override func display() {
        print("display mullard duck")
    }
}
