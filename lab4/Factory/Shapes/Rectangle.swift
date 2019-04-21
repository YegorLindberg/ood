//
//  Rectangle.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class Rectangle: Shape {
    private var color = Color.Black
    
    private var leftTop: CGPoint
    private var rightBottom: CGPoint
    
    init(leftTop: CGPoint, rightBottom: CGPoint, color: Color = Color.Black) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        self.color = color
    }
    
    func draw(canvas: InterfaceCanvas) {
        canvas.setColor(to: self.color)
        let rightTop   = CGPoint(x: self.rightBottom.x, y: self.leftTop.y)
        let leftBottom = CGPoint(x: self.leftTop.x, y: self.rightBottom.y)
        canvas.drawLine(from: self.leftTop, to: rightTop)
        canvas.drawLine(from: rightTop, to: self.rightBottom)
        canvas.drawLine(from: self.rightBottom, to: leftBottom)
        canvas.drawLine(from: leftBottom, to: self.leftTop)

    }
    
    func getColor() -> Color {
        return self.color
    }
    
    func getLeftTop() -> CGPoint {
        return self.leftTop
    }
    
    func getRightBottom() -> CGPoint{
        return self.rightBottom
    }
}
