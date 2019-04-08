//
//  MaterialParagraph.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class MaterialParagraph: Paragraph {
    private var text: String = ""
    private var oldText: String = ""

    init(text: String?) {
        print("paragraph was initialized")
        self.text = text == nil ? "" : text!
    }
    
    func getText() -> String {
        return self.text
    }
    
    func setText(newText: String) -> Void {
        self.text = newText
    }
    
    func setToOldText() {
        self.text = self.oldText
        
    }

}
