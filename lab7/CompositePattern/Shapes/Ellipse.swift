//
//  Ellipse.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class Ellipse: Shape {
    var frame = CGRect()
    private var center: CGPoint
    private var horizontalRadius: CGFloat
    private var verticalRadius: CGFloat
    
    var lineStyle: LineStyle
    var fillStyle: FillStyle
    
    init(center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat, lineStyle: LineStyle = LineStyle(), fillStyle: FillStyle = FillStyle()) {
        self.center = center
        self.horizontalRadius = horizontalRadius
        self.verticalRadius = verticalRadius
        self.lineStyle = lineStyle
        self.fillStyle = fillStyle
        self.frame = CGRect(x: CGFloat(center.x - horizontalRadius), y: CGFloat(center.y - verticalRadius), width: CGFloat(2 * horizontalRadius), height: CGFloat(2 * verticalRadius))
    }
    
    func draw(canvas: InterfaceCanvas) {
        canvas.setLineStyle(to: self.lineStyle)
        canvas.setFillStyle(to: self.fillStyle)
        canvas.drawEllipse(x: center.x - horizontalRadius, y: center.y - verticalRadius, width: horizontalRadius * 2, height: verticalRadius * 2)
    }
    
    func getCenter() -> CGPoint {
        return self.center
    }
    
    func getHorizontalRadius() -> CGFloat {
        return self.horizontalRadius
    }
    
    func getVerticalRadius() -> CGFloat {
        return self.verticalRadius
    }
}
