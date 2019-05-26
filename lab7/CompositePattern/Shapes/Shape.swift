//
//  Shape.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit

protocol Shape: class {
    func draw(canvas: InterfaceCanvas)
    var lineStyle: LineStyle { get set }
    var fillStyle: FillStyle { get set }
}

enum Shapes: String {
    case ellipse
    case triangle
    case rectangle
    case regularPolygon
}
