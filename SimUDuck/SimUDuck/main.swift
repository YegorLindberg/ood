//
//  main.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


func testDuck(_ duck: Duck, flyCount: Int) {
    duck.display()
    duck.swim()
    for _ in 1...flyCount {
        duck.fly()
    }
    duck.quack()
    duck.dance()
    print("")
}


testDuck(MullardDuck(), flyCount: 1)
testDuck(RedHeadDuck(), flyCount: 2)
testDuck(RubberDuck(), flyCount: 3)
testDuck(WoodDuck(), flyCount: 4)

