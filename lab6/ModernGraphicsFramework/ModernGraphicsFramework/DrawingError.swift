//
//  ErrorEnum.swift
//  ModernGraphicsFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

enum DrawingError: String, Error {
    case DrawingNotStarted = "Drawing has not been started"
    case DrawingCannotBePerformed = "DrawLine is allowed between beginDraw()/endDraw() only"
    case DrawingHasAlreadyBegun = "Drawing has already begun"
}
