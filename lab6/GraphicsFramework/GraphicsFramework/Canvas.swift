//
//  CanvasInterface.swift
//  GraphicsFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

public protocol Canvas {
    func moveTo(x: Int, y: Int)
    func lineTo(x: Int, y: Int)
}
