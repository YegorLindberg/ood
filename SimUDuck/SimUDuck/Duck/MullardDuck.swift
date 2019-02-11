//
//  MullardDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class MullardDuck: CDuck {

    override init () {
        super.init()
        setFlying(type: CFlyWithWings())
        setQuacking(type: CQuack())
        setDancing(type: CDanceWaltz())
    }
    
    override func display() {
        print("display mullard duck")
    }
    
}
