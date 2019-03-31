//
//  Canvas.swift
//  GraphicsFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

public class Canvas: CanvasInterface {
    
    public init() {}
    
    public func moveTo(x: Int, y: Int) {
        print("Move to (\(x), \(y))")
    }
    
    public func lineTo(x: Int, y: Int) {
        print("Line to (\(x), \(y))")
    }
    
}
