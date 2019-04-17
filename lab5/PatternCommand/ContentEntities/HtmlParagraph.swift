//
//  MaterialParagraph.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class HtmlParagraph: Paragraph {
    private(set) var text: String = ""

    init(text: String) {
        print("paragraph was initialized")
        self.text = text
    }
    
    func setText(newText: String, history: Executor) -> Void {
        let oldText = self.text
        
        history.addAndExecute(command: Command(onExecute: { self.text = newText },
                                               onUnexecute: { self.text = oldText }))
    }

}
