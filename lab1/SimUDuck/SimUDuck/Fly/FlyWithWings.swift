//
//  CFlyWithWings.swift
//  SimUDuck
//
//  Created by Yegor Lindberg on 04/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class FlyWithWings: IFlyBehavior {
    
    private var countOfDepartures = 0
    
    func fly() {
        self.countOfDepartures += 1
        print("fly with wings: ", countOfDepartures)
    }
    
}
