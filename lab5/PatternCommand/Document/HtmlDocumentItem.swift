//
//  HtmlDocumentItem.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class HtmlDocumentItem: DocumentItem {
    
    private(set) var paragraph: Paragraph?
    private(set) var image: Image?
    private(set) var documentContentType: DocumentContentType
    
    init(paragraph: Paragraph) {
        self.documentContentType = .paragraph
        self.paragraph = paragraph
    }
    
    init(image: Image) {
        documentContentType = .image
        self.image = image
    }
    
}
