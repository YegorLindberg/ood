//
//  RubberDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class RubberDuck: Duck {
    
    override init() {
        super.init()
        flying = FlyNoWay()
        quacking = Squeak()
        dancing = DanceNoWay()
    }
    
    override func display() {
        print("display rubber duck")
    }
    
}
