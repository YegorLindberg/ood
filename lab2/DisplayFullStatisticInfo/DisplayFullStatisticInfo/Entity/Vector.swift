//
//  Vector.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 24/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

struct Vector {
    
    var x: Double
    var y: Double
    
    init(direction: Double) {
        let x = cos(direction * Double.pi / 180)
        let y = sin(direction * Double.pi / 180)
        self.x = x
        self.y = y
    }
    
}
