//
//  ViewController.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var labelWrongCommand: UILabel!
    @IBOutlet weak var  textFieldCommand: UITextField!
    
    @IBOutlet weak var canvas: Canvas!
    private var shapeFactory = ShapeFactory()
    
    private var shapesArr = [String]()
    private var     color = Color.Black
    private var     draft: PictureDraft?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.viewTapped(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGesture)

    }
    
    @objc func viewTapped(gestureRecognizer: UIGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func onApplyCommandButtonTouch(_ sender: UIButton) {
        guard (self.textFieldCommand.text != ""  && self.textFieldCommand.text != nil) else {
            self.labelWrongCommand.isHidden = false
            return
        }
        let instruction = self.color.rawValue + " " + self.textFieldCommand.text!
        guard let shape = self.shapeFactory.createShape(description: instruction) else {
            print("shape not created")
            return
        }
        print("shape was created")
        shape.draw(canvas: canvas)
        self.shapesArr.append(instruction)
    }
    
    @IBAction func onSaveInDraftButtonTouch(_ sender: UIButton) {
        let designer = Designer(factory: ShapeFactory())
        let draft = designer.createDraft(strm: self.shapesArr)
        self.draft = draft
    }
    
    @IBAction func onDraftButtonTouch(_ sender: UIButton) {
        if let draft = self.draft {
            let painter = Painter()
            painter.drawPicture(draft: draft, canvas: self.canvas)
        }
    }
    
    @IBAction func setColorToRedButtonTouch(_ sender: UIButton) {
        self.color = Color.Red
        selectColor()
    }
    @IBAction func setColorToGreenButtonTouch(_ sender: UIButton) {
        self.color = Color.Green
        selectColor()
    }
    @IBAction func setColorToBlueButtonTouch(_ sender: UIButton) {
        self.color = Color.Blue
        selectColor()
    }
    @IBAction func setColorToYellowButtonTouch(_ sender: UIButton) {
        self.color = Color.Yellow
        selectColor()
    }
    @IBAction func setColorToPinkButtonTouch(_ sender: UIButton) {
        self.color = Color.Pink
        selectColor()
    }
    @IBAction func setColorToBlackButtonTouch(_ sender: UIButton) {
        self.color = Color.Black
        selectColor()
    }
    
    @IBOutlet weak var redColorButton: UIButton!
    @IBOutlet weak var greenColorButton: UIButton!
    @IBOutlet weak var blueColorButton: UIButton!
    @IBOutlet weak var yellowColorButton: UIButton!
    @IBOutlet weak var pinkColorButton: UIButton!
    @IBOutlet weak var blackColorButton: UIButton!
    
    private func selectColor() {
        if color == Color.Red {self.redColorButton.isSelected = true} else {self.redColorButton.isSelected = false}
        if color == Color.Green {self.greenColorButton.isSelected = true} else {self.greenColorButton.isSelected = false}
        if color == Color.Blue {self.blueColorButton.isSelected = true} else {self.blueColorButton.isSelected = false}
        if color == Color.Yellow {self.yellowColorButton.isSelected = true} else {self.yellowColorButton.isSelected = false}
        if color == Color.Pink {self.pinkColorButton.isSelected = true} else {self.pinkColorButton.isSelected = false}
        if color == Color.Black {self.blackColorButton.isSelected = true} else {self.blackColorButton.isSelected = false}
    }
}

