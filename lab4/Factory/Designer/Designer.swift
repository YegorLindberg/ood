//
//  Designer.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Designer: InterfaceDesigner {
    private let factory: InterfaceShapeFactory
    
    init(factory: InterfaceShapeFactory) {
        self.factory = factory
    }

    func createDraft(strm: [String]) -> PictureDraft {
        var shapes = [Shape]()
        
        for instruction in strm {
            if let shape = factory.createShape(description: instruction) {
                shapes.append(shape)
            }
        }
        
        return PictureDraft(shapes: shapes)

    }
    
    
}
