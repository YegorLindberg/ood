//
//  Triangle.swift
//  ShapeDrawingFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import GraphicsFramework


public class Triangle: CanvasDrawableInterface {
    private var top1: Point
    private var top2: Point
    private var top3: Point
    
    public init(top1: Point, top2: Point, top3: Point) {
        self.top1 = top1
        self.top2 = top2
        self.top3 = top3
    }
    
    public func Draw(canvas: CanvasInterface) {
        canvas.moveTo(x: self.top1.x, y: self.top1.y)
        canvas.lineTo(x: self.top2.x, y: self.top2.y)
        canvas.lineTo(x: self.top3.x, y: self.top3.y)
        canvas.lineTo(x: self.top1.x, y: self.top1.y)
    }
}
