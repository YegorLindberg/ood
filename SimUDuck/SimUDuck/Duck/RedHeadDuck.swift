//
//  RedHeadDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class RedHeadDuck: CDuck {
    
    override init() {
        super.init()
        setFlying(type: CFlyWithWings())
        setQuacking(type: CQuack())
        setDancing(type: CDanceMinuet())
    }
    
    override func display() {
        print("display redhead duck")
    }
}
