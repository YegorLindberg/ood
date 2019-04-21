//
//  InterfaceShapeFactory.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol InterfaceShapeFactory {
    func createShape(description: String) -> Shape?
}
