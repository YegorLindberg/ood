//
//  InterfaceCanvas.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

protocol InterfaceCanvas {
    func setColor(to color: Color)
    func drawLine(from: CGPoint, to: CGPoint)
    func drawEllipse(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
}
