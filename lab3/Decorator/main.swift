//
//  main.swift
//  Decorator
//
//  Created by Yegor Lindberg on 09/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

var tea = Tea()
print("tea cost:", tea.getCost())
var teaWithCinnamon = Cinnamon(beverage: tea)
print("tea with cinnamon cost:", teaWithCinnamon.getCost())
var teaWithDoubleCinnamon = Cinnamon(beverage: teaWithCinnamon)
print("tea with double cinnamon cost:", teaWithDoubleCinnamon.getCost())
print("tea with double cinnamon descriprion:", teaWithDoubleCinnamon.getDescription())
