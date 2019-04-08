//
//  ModernGraphicsRender.swift
//  ModernGraphicsFramework
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

public class ModernGraphicsRender {
    private var isDrawing: Bool = false
    
    public init() {}
    
    deinit {
        if self.isDrawing {
           try? self.endDraw()
        }
    }
    
    public func beginDraw() throws {
        if self.isDrawing {
            throw DrawingError.DrawingHasAlreadyBegun
        }
        self.isDrawing = true
        print("<draw>")
    }
    
    public func drawLine(start: Point, end: Point) throws {
        if !isDrawing {
            throw DrawingError.DrawingCannotBePerformed
        }
        print("(<line fromX=\"\(start.x)\" fromY=\"\(start.y)\", toX=\"\(end.x)\" toY=\"\(end.y)\"/>)")
    }
    
    public func endDraw() throws {
        if !self.isDrawing {
            throw DrawingError.DrawingNotStarted
        }
        self.isDrawing = false
        print("</draw>\n")
    }
    
}
