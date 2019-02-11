//
//  CDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class CDuck {
    private var   flying: ((_ count: Int) -> ())?
    private var quacking: (() -> ())?
    private var  dancing: (() -> ())?
    
    private var flyCount = 0
    
    func swim() {
        print("swim")
    }
    
    func display() {
        print("display duck")
    }
    
    func setFlying(_ flying: @escaping (_ count: Int) -> ()) {
        flyCount = 0
        self.flying = flying
    }
    func fly() {
        flyCount += 1
        flying?(flyCount)
    }
    
    func setQuacking(_ quacking: @escaping () -> ()) {
        self.quacking = quacking
    }
    func quack() {
        quacking?()
    }
    
    func setDancing(_ dancing: @escaping () -> ()) {
        self.dancing = dancing
    }
    func dance() {
        dancing?()
    }

}
