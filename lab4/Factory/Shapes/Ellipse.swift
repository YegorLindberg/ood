//
//  Ellipse.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class Ellipse: Shape {
    private var color = Color.Black
    
    private var center: CGPoint
    private var horizontalRadius: CGFloat
    private var verticalRadius: CGFloat
    
    init(center: CGPoint, horizontalRadius: CGFloat, verticalRadius: CGFloat, color: Color = Color.Black) {
        self.center = center
        self.horizontalRadius = horizontalRadius
        self.verticalRadius = verticalRadius
        self.color = color
    }
    
    func draw(canvas: InterfaceCanvas) {
        canvas.setColor(to: self.color)
        canvas.drawEllipse(x: center.x - horizontalRadius, y: center.y - verticalRadius, width: horizontalRadius * 2, height: verticalRadius * 2)
    }
    
    func getColor() -> Color{
        return self.color
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
