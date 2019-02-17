//
//  CDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Duck {
    var   flying: (() -> Int)?
    var quacking: (() -> ())?
    var  dancing: (() -> ())?
    
    final func swim() {
        print("swim")
    }
    
    func display() {
        print("display duck")
    }

    final func fly() {
        flying?()
    }

    final func quack() {
        quacking?()
    }
    
    final func dance() {
        dancing?()
    }

}
