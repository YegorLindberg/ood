//
//  CDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class Duck {
    var   flying: IFlyBehavior!
    var quacking: IQuackBehavior!
    var  dancing: IDance!
    
    final func swim() {
        print("swim")
    }
    
    func display() {}
    
    final func fly() {
        self.flying.fly()
    }
    
    final func quack() {
        self.quacking.quack()
    }

    final func dance() {
        self.dancing.dance()
    }

}
