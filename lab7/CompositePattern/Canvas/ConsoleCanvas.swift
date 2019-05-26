//
//  ConsoleCanvas.swift
//  CompositePattern
//
//  Created by Yegor Lindberg on 21/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit

class ConsoleCanvas: InterfaceCanvas {

    private var lineStyle = LineStyle()
    private var fillStyle = FillStyle()
    
    func setLineStyle(to lineStyle: LineStyle) {
        self.lineStyle = lineStyle
    }
    
    func setFillStyle(to fillStyle: FillStyle) {
        self.fillStyle = fillStyle
    }
    
    func drawLine(from: CGPoint, to: CGPoint) {
        print("---Draw Line---")
        print("line color:", self.lineStyle.color.cgColor)
        print("line width:", self.lineStyle.lineWidth)
        print("draw line from: \(from), to: \(to)")
    }
    
    func drawEllipse(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        print("---Draw Ellipse---")
        print("ellipse fill color:", self.fillStyle.color.cgColor)
        print("ellipse line color:", self.lineStyle.color.cgColor)
        print("ellipse line width:", self.lineStyle.lineWidth)
        print("ovalIn: Rectangle(x: \(x), y: \(y), width: \(width), height: \(height))")
    }
    
    func drawFigureByPoints(with arrayOfPoints: [CGPoint]) {
        guard arrayOfPoints.count > 2 else {
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
