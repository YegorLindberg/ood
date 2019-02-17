//
//  WoodDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 11/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class WoodDuck: Duck {
    
    override init() {
        super.init()
        flying = FlyNoWay()
        quacking = MuteQuack()
        dancing = DanceNoWay()
    }
    
    override func display() {
        print("display wood duck")
    }
    
}
