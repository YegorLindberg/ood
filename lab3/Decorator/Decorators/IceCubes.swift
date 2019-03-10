//
//  IceCubes.swift
//  Decorator
//
//  Created by Yegor Lindberg on 10/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

enum IceCubeType: String {
    case Dry = "Dry"     // Сухой лед (для суровых сибирских мужиков)
    case Water = "Water" // Обычные кубики из воды
}

class IceCubes: CondimentDecorator {
    private var quantity: UInt   = 1
    private var iceCubeType: IceCubeType
    private var dryIceCubeCost   = 10.0
    private var waterIceCubeCost = 5.0
    
    
    init(beverage: Beverage, quantity: UInt, iceCubeType: IceCubeType = IceCubeType.Water) {
        self.iceCubeType = iceCubeType
        self.quantity = quantity
        super.init(beverage: beverage)
    }
    
    override func getCost() -> Double {
        return super.getCost() + (self.iceCubeType == IceCubeType.Water ? self.waterIceCubeCost : self.dryIceCubeCost) * Double(self.quantity)
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", " + self.iceCubeType.rawValue + " Ice Cube x \(self.quantity)"
    }
    
}
