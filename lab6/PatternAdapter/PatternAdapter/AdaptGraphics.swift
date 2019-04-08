//
//  AdaptGraphics.swift
//  PatternAdapter
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import GraphicsFramework
import ModernGraphicsFramework

class AdaptGraphics: Canvas {
    private var render: ModernGraphicsRender
    private var beginPoint: Point?
    
    init(render: ModernGraphicsRender) {
        self.render = render
    }
    
    func moveTo(x: Int, y: Int) {
        self.beginPoint = Point(x: x, y: y)
    }
    
    func lineTo(x: Int, y: Int) {
        guard self.beginPoint != nil else {
            print("begin point for shape is nil")
            return
        }
        
        do {
            let endPoint = Point(x: x, y: y)
            try self.render.drawLine(start: self.beginPoint!, end: endPoint)
            self.beginPoint = endPoint
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
