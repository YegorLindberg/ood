//
//  MaterialParagraph.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class ListParagraph: Paragraph {
    private(set) var text: String = ""

    init(text: String?) {
        print("paragraph was initialized")
        self.text = text == nil ? "" : text!
    }
    
    func setText(newText: String) -> Void {
        self.text = newText
    }

}
