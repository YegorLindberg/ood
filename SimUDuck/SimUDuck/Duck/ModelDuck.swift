//
//  ModelDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 11/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class ModelDuck: Duck {
    
    override init() {
        super.init()
        flying = FlyNoWay()
        quacking = MuteQuack()
        dancing = DanceNoWay()
    }
    
    func setFlying(type: IFlyBehavior) {
        flying = type
    }
    func setQuacking(type: IQuackBehavior) {
        quacking = type
    }
    
    override func display() {
        print("display model duck")
    }
    
}
