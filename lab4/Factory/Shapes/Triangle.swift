//
//  Triangle.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class Triangle: Shape {
    private var color = Color.Black
    
    private var vertex1: CGPoint
    private var vertex2: CGPoint
    private var vertex3: CGPoint

    init(vertex1: CGPoint, vertex2: CGPoint, vertex3: CGPoint, color: Color = Color.Black) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
        self.color = color
    }

    func draw(canvas: InterfaceCanvas) {
        canvas.setColor(to: self.color)
        canvas.drawLine(from: self.vertex1, to: self.vertex2)
        canvas.drawLine(from: self.vertex2, to: self.vertex3)
        canvas.drawLine(from: self.vertex3, to: self.vertex1)
    }
    
    func getColor() -> Color {
        return self.color
    }
    
    func getVertex1() -> CGPoint {
        return self.vertex1
    }
    
    func getVertex2() -> CGPoint {
        return self.vertex2
    }
    
    func getVertex3() -> CGPoint {
        return self.vertex3
    }
}
