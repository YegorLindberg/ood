//
//  Shape.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

protocol Shape {
    func draw(canvas: InterfaceCanvas)
    func getColor() -> Color
}

enum Shapes: String {
    case ellipse
    case triangle
    case rectangle
    case regularPolygon
}
