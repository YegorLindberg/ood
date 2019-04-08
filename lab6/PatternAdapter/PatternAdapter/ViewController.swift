//
//  ViewController.swift
//  PatternAdapter
//
//  Created by Yegor Lindberg on 31/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit
import GraphicsFramework
import ShapeDrawingFramework
import ModernGraphicsFramework


class ViewController: UIViewController {
    
    private var graphicType: Int = 0

    @IBAction func changeGraphicTypeTouched(_ sender: UISegmentedControl) {
        self.graphicType = (sender.selectedSegmentIndex == 0 || sender.selectedSegmentIndex == 1) ? sender.selectedSegmentIndex : 0
    }
    
    @IBAction func onPaintButtonTouch(_ sender: UIButton) {
        if self.graphicType == 0 {
            self.paintPictureOnCanvas()
        } else {
            self.paintPictureOnModernGraphicsRenderer()
        }
    }
    
    func paintPicture(painter: CanvasPainter) {
        let triangle = Triangle(top1: Point(x: 10, y: 15), top2: Point(x: 100, y: 200), top3: Point(x: 150, y: 250))
        let rectangle = Rectangle(leftTop: Point(x: 30, y: 40), width: 18, height: 24)
        
        painter.Draw(drawable: triangle)
        print()
        painter.Draw(drawable: rectangle)
    }
    
    func paintPictureOnCanvas() {
        let simpleCanvas = ConsoleCanvas()
        let painter = CanvasPainter(canvas: simpleCanvas)
        self.paintPicture(painter: painter)
        print("\n")
    }
    
    func paintPictureOnModernGraphicsRenderer() {
        let render = ModernGraphicsRender()
        do {
            try render.beginDraw()
            let adaptedCanvas = AdaptGraphics(render: render)
            let painter = CanvasPainter(canvas: adaptedCanvas)
            self.paintPicture(painter: painter)
            try render.endDraw()
        } catch {
            print(error.localizedDescription)
        }
        print("\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.paintPictureOnCanvas()
    }


}

