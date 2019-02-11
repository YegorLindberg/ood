//
//  WoodDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 11/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class WoodDuck: CDuck {
    
    override init() {
        super.init()
        setFlying(type: CFlyNoWay())
        setQuacking(type: CMuteQuack())
        setDancing(type: CDanceNoWay())
    }
    
    override func display() {
        print("display wood duck")
    }
    
}
