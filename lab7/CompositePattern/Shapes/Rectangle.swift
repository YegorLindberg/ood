//
//  Rectangle.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class Rectangle: Shape {
    var frame = CGRect()
    private var leftTop: CGPoint
    private var rightBottom: CGPoint
    
    var lineStyle: LineStyle
    var fillStyle: FillStyle

    init(leftTop: CGPoint, rightBottom: CGPoint, lineStyle: LineStyle = LineStyle(), fillStyle: FillStyle = FillStyle()) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        self.lineStyle = lineStyle
        self.fillStyle = fillStyle
        self.frame = CGRect(x: leftTop.x, y: leftTop.y, width: CGFloat(rightBottom.x - leftTop.x), height: CGFloat(leftTop.y - rightBottom.y))
    }
    
    func draw(canvas: InterfaceCanvas) {
        print("===draw rectangle===")
        canvas.setLineStyle(to: self.lineStyle)
        canvas.setFillStyle(to: self.fillStyle)
        let rightTop   = CGPoint(x: self.rightBottom.x, y: self.leftTop.y)
        let leftBottom = CGPoint(x: self.leftTop.x, y: self.rightBottom.y)
        canvas.drawLine(from: self.leftTop, to: rightTop)
        canvas.drawLine(from: rightTop, to: self.rightBottom)
        canvas.drawLine(from: self.rightBottom, to: leftBottom)
        canvas.drawLine(from: leftBottom, to: self.leftTop)

    }
 
    func getLeftTop() -> CGPoint {
        return self.leftTop
    }
    
    func getRightBottom() -> CGPoint{
        return self.rightBottom
    }
}
