//
//  RedHeadDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class RedHeadDuck: Duck {
    
    override init() {
        super.init()
        flying = FlyWithWings()
        quacking = Quack()
        dancing = DanceMinuet()
    }
    
    override func display() {
        print("display redhead duck")
    }
}
