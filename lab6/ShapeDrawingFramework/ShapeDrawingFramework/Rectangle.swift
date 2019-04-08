//
//  Rectangle.swift
//  ShapeDrawingFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import GraphicsFramework


public class Rectangle: CanvasDrawable {
    private var leftTop: Point
    private var width: Int
    private var height: Int

    public init(leftTop: Point, width: Int, height: Int) {
        self.leftTop = leftTop
        self.width = width
        self.height = height
    }
    
    public func Draw(canvas: Canvas) {
        canvas.moveTo(x: self.leftTop.x, y: self.leftTop.y)
        canvas.lineTo(x: (self.leftTop.x + width), y: self.leftTop.y)
        canvas.lineTo(x: (self.leftTop.x + width), y: (self.leftTop.y - height))
        canvas.lineTo(x: self.leftTop.x, y: (self.leftTop.y - height))
        canvas.lineTo(x: self.leftTop.x, y: self.leftTop.y)
    }
   
}
