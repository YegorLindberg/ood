//
//  MullardDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class MullardDuck: Duck {

    override init () {
        super.init()
        flying = FlyWithWings()
        quacking = Quack()
        dancing = DanceWaltz()
    }
    
    override func display() {
        print("display mullard duck")
    }
    
}
