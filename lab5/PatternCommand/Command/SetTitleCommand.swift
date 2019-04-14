//
//  SetTitleCommand.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class SetTitleCommand: Commandable {
    private var document: Document
    private var title: String
    private var oldTitle: String
    
    init(document: Document, title: String) {
        self.document = document
        self.title = title
        self.oldTitle = document.title
    }
    
    func execute() {
        document.title = self.title
    }
    
    func unexecute() {
        document.title = self.oldTitle
    }

}
