//
//  PictureDraft.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class PictureDraft {
//    private var currentShape = -1
    private var shapes: [Shape]
    
    init(shapes: [Shape]) {
        self.shapes = shapes
    }
    //TODO: to delete
//    var arrIsEnd: Bool {
//        return self.currentShape + 1 == self.shapes.count
//    }
//
//    var nextShape: Shape? {
//        if currentShape + 1 != shapes.count {
//            print ("in next shape")
//            self.currentShape += 1
//            return self.shapes[currentShape]
//        } else {
//            return nil
//        }
//    }
//
//    func resetCurrent() {
//        self.currentShape = -1
//    }
    
    func getShapeCount() -> Int {
        return self.shapes.count
    }
    
    func getShape(by index: Int) -> Shape {
       return self.shapes[index]
    }
}
