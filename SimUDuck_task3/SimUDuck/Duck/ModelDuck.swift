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
        
        self.dancing = danceNoWay
        
        self.quacking = muteQuack
        
        self.flying = flyNoWay()
    }
    
    func setFlying(_ flying: @escaping () -> Int) {
        self.flying = flying
    }
    
    func setQuacking(_ quacking: @escaping () -> ()) {
        self.quacking = quacking
    }
    
    override func display() {
        print("display wood duck")
    }
    
}
