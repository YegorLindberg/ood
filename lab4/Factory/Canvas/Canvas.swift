//
//  Canvas.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit


class Canvas: UIView, InterfaceCanvas {
    private let lineThickness: CGFloat = 4
    private var color = Color.Black
    
    func setColor(to color: Color) {
        self.color = color
    }
    
    func drawLine(from: CGPoint, to: CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        line.strokeColor = self.color.toCGColor
        line.lineWidth = self.lineThickness
        linePath.move(to: from)
        linePath.addLine(to: to)
        line.path = linePath.cgPath
        line.lineJoin = CAShapeLayerLineJoin.round
        self.layer.addSublayer(line)
    }
    
    func drawEllipse(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: width, height: height))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = ovalPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = self.color.toCGColor
        shapeLayer.lineWidth = self.lineThickness
        self.layer.addSublayer(shapeLayer)
        print("sublayer was added")
    }
    
}
