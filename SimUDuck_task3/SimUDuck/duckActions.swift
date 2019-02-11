//
//  duckActions.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 10/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

func usualQuacking() {
    print("quack-quack")
}

func squeak() {
    print("squeeeeak")
}

func muteQuack() {
    print("mute quacking")
}


func doFly() -> () -> Int {
    var counter = 0
    func makeFly() -> Int {
        counter += 1
        print("fly with wings \(counter)")
        return counter
    }
    return makeFly
}

func flyNoWay() -> () -> Int {
    var counter = 0
    func makeFly() -> Int {
        print("not flying \(counter)")
        return counter
    }
    return makeFly
}


func danceWaltz() {
    print("dancing waltz")
}

func danceMinuet() {
    print("dancing minuet")
}

func danceNoWay() {
    print("dance no way")
}
