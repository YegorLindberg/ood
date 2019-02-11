//
//  CFlyNoWay.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class CFlyNoWay: IFlyBehavior {
    
    private var countOfDeparture = 0
    
    func increaseDepartureCount() {
        self.countOfDeparture = 0 //because she can't flying
    }
    
    func printCountOfDepartures() {
        print(countOfDeparture)
    }
    
    func fly() {
        print("not flying")
    }
    
}
