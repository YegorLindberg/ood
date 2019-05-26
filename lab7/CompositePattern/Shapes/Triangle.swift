//
//  Triangle.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class Triangle: Shape {
    var frame = CGRect()
    private var vertex1: CGPoint
    private var vertex2: CGPoint
    private var vertex3: CGPoint
    
    private let largestDescr = "largest"
    private let smallestDescr = "smallest"
    
    var lineStyle: LineStyle
    var fillStyle: FillStyle

    init(vertex1: CGPoint, vertex2: CGPoint, vertex3: CGPoint, lineStyle: LineStyle = LineStyle(), fillStyle: FillStyle = FillStyle()) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
        self.lineStyle = lineStyle
        self.fillStyle = fillStyle
        
        let x = getSmallestAndLargestValues(firstVal: vertex1.x, secondVal: vertex2.x, thirdVal: vertex3.x)
        let y = getSmallestAndLargestValues(firstVal: vertex1.y, secondVal: vertex2.y, thirdVal: vertex3.y)
        self.frame = CGRect(x: x[smallestDescr]!, y: y[largestDescr]!, width: CGFloat(x[largestDescr]! - x[smallestDescr]!), height: CGFloat(y[largestDescr]! - y[smallestDescr]!))
    }

    func getSmallestAndLargestValues(firstVal: CGFloat, secondVal: CGFloat, thirdVal: CGFloat) -> [String : CGFloat] {
        let firstSmallest = compareValues(firstVal: firstVal, secondVal: secondVal)
        let firstLargest = compareValues(firstVal: firstVal, secondVal: thirdVal)
        
        let smallest = compareValues(firstVal: firstSmallest[smallestDescr]!, secondVal: firstLargest[smallestDescr]!)
        let largest = compareValues(firstVal: firstLargest[largestDescr]!, secondVal: firstSmallest[largestDescr]!)
        
        return [
            smallestDescr : smallest[smallestDescr]!,
            largestDescr : largest[largestDescr]!
        ]
    }
    
    func compareValues(firstVal: CGFloat, secondVal: CGFloat) -> [String : CGFloat] {
        if firstVal > secondVal {
            return [
                smallestDescr : secondVal,
                largestDescr : firstVal
            ]
        }
        return [
            smallestDescr : firstVal,
            largestDescr : secondVal
        ]
    }
    
    func draw(canvas: InterfaceCanvas) {
        canvas.setLineStyle(to: self.lineStyle)
        canvas.setFillStyle(to: self.fillStyle)
        canvas.drawLine(from: self.vertex1, to: self.vertex2)
        canvas.drawLine(from: self.vertex2, to: self.vertex3)
        canvas.drawLine(from: self.vertex3, to: self.vertex1)
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
