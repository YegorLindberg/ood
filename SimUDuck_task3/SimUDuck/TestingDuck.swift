//
//  ProvokeDuck.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

func testingDuck(_ duck: Duck) {
    duck.display()
    duck.swim()
    duck.quack()
    for _ in 1...3 {
        duck.fly()
    }
    duck.dance()
    print("")
}
