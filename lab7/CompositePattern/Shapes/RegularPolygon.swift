//
//  RegularPolygon.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class RegularPolygon: Shape {
    var frame = CGRect()
    private var vertexCount: Int
    private var center: CGPoint
    private var radius: CGFloat
    
    var lineStyle: LineStyle
    var fillStyle: FillStyle
    
    init(center: CGPoint, radius: CGFloat, vertexCount: Int, lineStyle: LineStyle = LineStyle(), fillStyle: FillStyle = FillStyle()) {
        self.vertexCount = vertexCount > 2 ? vertexCount : 3
        self.center = center
        self.radius = radius
        self.lineStyle = lineStyle
        self.fillStyle = fillStyle
        self.frame = CGRect(x: CGFloat(center.x - radius), y: CGFloat(center.y - radius), width: CGFloat(2 * radius), height: CGFloat(2 * radius))
    }

    func draw(canvas: InterfaceCanvas) {
        canvas.setLineStyle(to: self.lineStyle)
        canvas.setFillStyle(to: self.fillStyle)
        var previousPoint = calculatePoint(by: 0)
        for numVertex in 1...self.vertexCount {
            let nextPoint = calculatePoint(by: numVertex)
            canvas.drawLine(from: previousPoint, to: nextPoint)
            previousPoint = nextPoint
        }
    }
    
    private func calculatePoint(by numberOfVertex: Int) -> CGPoint {
        let angleInRadians = 2 * CGFloat.pi * CGFloat(numberOfVertex) / CGFloat(self.vertexCount)
        let point = CGPoint(x: self.radius * cos(angleInRadians) + self.center.x,
                            y: self.radius * sin(angleInRadians) + self.center.y)
        return point
    }
    
    func getVertexCount() -> Int {
        return self.vertexCount
    }
    
    func getCenter() -> CGPoint {
        return self.center
    }
    
    func getRadius() -> CGFloat {
        return self.radius
    }
}
