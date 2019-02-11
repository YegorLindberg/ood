//
//  CFlyNoWay.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class FlyNoWay: IFlyBehavior {
    
    private let countOfDeparture = 0
    
    func fly() {
        print("not flying")
    }
    
    func printCountOfDepartures() {
        print(countOfDeparture)
    }
 
}
