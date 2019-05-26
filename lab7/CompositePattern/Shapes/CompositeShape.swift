//
//  CompositeShape.swift
//  CompositePattern
//
//  Created by Yegor Lindberg on 02/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit


class CompositeShape: Shape {
    
    private var shapes = [Shape]()
    
    var lineStyle = LineStyle()
    var fillStyle = FillStyle()
    
    func add(_ shape: Shape) {
        self.shapes.append(shape)
    }
    
    func remove(_ shape: Shape) {
        if let index = shapes.firstIndex(where: { $0 === shape }) {
            self.shapes.remove(at: index)
        } else {
            print("index for shape not found and not removed from composite.")
        }
    }
    
    func draw(canvas: InterfaceCanvas) {
        print(self.shapes.reduce("\n", { "\($0)\($1.draw(canvas: canvas))" }))
    }
    
    
}
