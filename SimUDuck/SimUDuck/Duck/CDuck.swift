//
//  CDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class CDuck {
    private var flying: IFlyBehavior!
    private var quacking: IQuackBehavior!
    private var dancing: IDance!
    
    func swim() {
        print("swim")
    }
    
    func display() {
        print("display duck")
    }
    
    func setFlying(type: IFlyBehavior) {
        self.flying = type
    }
    func fly() {
        self.flying.fly()
        self.flying.increaseDepartureCount()
    }
    func printCountOfDepartures() {
        self.flying.printCountOfDepartures()
    }
    
    func setQuacking(type: IQuackBehavior) {
        self.quacking = type
    }
    func quack() {
        self.quacking.quack()
    }
    
    func setDancing(type: IDance) {
        self.dancing = type
    }
    func dance() {
        self.dancing.dance()
    }

}
