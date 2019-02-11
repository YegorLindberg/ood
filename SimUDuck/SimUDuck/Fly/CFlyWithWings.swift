//
//  CFlyWithWings.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class CFlyWithWings: IFlyBehavior {
    
    private var countOfDepartures = 0
    
    func fly() {
        print("fly with wings")
    }
    
    func increaseDepartureCount() {
        self.countOfDepartures += 1
    }
    
    func printCountOfDepartures() {
        print(countOfDepartures)
    }
}
