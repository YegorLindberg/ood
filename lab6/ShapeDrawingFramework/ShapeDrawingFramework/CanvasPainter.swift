//
//  CanvasPainter.swift
//  ShapeDrawingFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import GraphicsFramework


public class CanvasPainter {
    private var canvas: CanvasInterface
    
    public init(canvas: CanvasInterface) {
        self.canvas = canvas
    }
    
    public func Draw(drawable: CanvasDrawableInterface) {
        drawable.Draw(canvas: self.canvas)
    }
}
