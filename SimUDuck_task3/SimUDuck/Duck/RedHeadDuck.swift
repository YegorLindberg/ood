//
//  RedHeadDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class RedHeadDuck: CDuck {
    
    override init() {
        super.init()
        
        self.setDancing(danceMinuet)
        
        self.setQuacking(quacking)
        
        self.setFlying(flyWithWings)
    }
    
    override func display() {
        print("display redhead duck")
    }
}
