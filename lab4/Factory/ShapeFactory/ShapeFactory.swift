//
//  ShapeFactory.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit

class ShapeFactory: InterfaceShapeFactory {
    
    
    func createShape(description: String) -> Shape? {
        let commandArr = description.components(separatedBy: " ")
        
        guard commandArr.count > 4 else {
            print("must be more arguments")
            return nil
        }
        
        guard let color = Color.init(rawValue: commandArr[0]) else { return nil }
        guard let shapeType = Shapes.init(rawValue: commandArr[1]) else { return nil }
        var shapeDescriptions = [CGFloat]()
        for command in commandArr[2...commandArr.count - 1] {
            guard let doubleUnit = Double(command) else { return nil }
            shapeDescriptions.append(CGFloat(doubleUnit))
        }
        if shapeType == Shapes.ellipse || shapeType == Shapes.rectangle || shapeType == Shapes.regularPolygon {
            guard shapeDescriptions.count == 4 else { return nil }
        } else {
            guard shapeDescriptions.count == 6 else { return nil }
        }
        return initShape(shapeType, descriptionUnits: shapeDescriptions, color: color)
    }
    
    private func initShape(_ shapeType: Shapes, descriptionUnits: [CGFloat], color: Color) -> Shape? {
        switch shapeType {
        case .ellipse:
        return Ellipse(center: CGPoint(x: descriptionUnits[0], y: descriptionUnits[1]), horizontalRadius: descriptionUnits[2], verticalRadius: descriptionUnits[3], color: color)
        case .triangle:
        return Triangle(vertex1: CGPoint(x: descriptionUnits[0], y: descriptionUnits[1]), vertex2: CGPoint(x: descriptionUnits[2], y: descriptionUnits[3]), vertex3: CGPoint(x: descriptionUnits[4], y: descriptionUnits[5]), color: color)
        case .rectangle:
        return Rectangle(leftTop: CGPoint(x: descriptionUnits[0], y: descriptionUnits[1]), rightBottom: CGPoint(x: descriptionUnits[2], y: descriptionUnits[3]), color: color)
        case .regularPolygon:
        return RegularPolygon(center: CGPoint(x: descriptionUnits[0], y: descriptionUnits[1]), radius: descriptionUnits[2], vertexCount: Int(descriptionUnits[3]), color: color)
        }
    }
}
