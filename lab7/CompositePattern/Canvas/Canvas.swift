//
//  Canvas.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit


class Canvas: UIView, InterfaceCanvas {

    private var lineStyle = LineStyle()
    private var fillStyle = FillStyle()
    
    func setLineStyle(to lineStyle: LineStyle) {
        self.lineStyle = lineStyle
    }
    
    func setFillStyle(to fillStyle: FillStyle) {
        self.fillStyle = fillStyle
    }

    func drawLine(from: CGPoint, to: CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        line.strokeColor = self.lineStyle.color.cgColor
        line.lineWidth = self.lineStyle.lineWidth
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
        shapeLayer.strokeColor = self.lineStyle.color.cgColor
        shapeLayer.lineWidth = self.lineStyle.lineWidth
        self.layer.addSublayer(shapeLayer)
    }
 
    func drawFigureByPoints(with arrayOfPoints: [CGPoint]) {
        guard arrayOfPoints.count > 2  else {
            return
        }
        
        var lastPoint = arrayOfPoints[0]
        for point in arrayOfPoints {
            if lastPoint != point {
                self.drawLine(from: lastPoint, to: point)
                lastPoint = point
            }
            if point == arrayOfPoints[arrayOfPoints.count - 1] {
                self.drawLine(from: point, to: arrayOfPoints[arrayOfPoints.count - 1])
            }
        }
    }
    
}
