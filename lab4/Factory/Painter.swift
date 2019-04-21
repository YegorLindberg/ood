//
//  InterfacePainter.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Painter {
    
    func drawPicture(draft: PictureDraft, canvas: Canvas) {
        for index in 0...(draft.getShapeCount() - 1)  {
            let shape = draft.getShape(by: index)
            shape.draw(canvas: canvas)
        }
    }

}
