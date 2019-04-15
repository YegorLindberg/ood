//
//  MaterialDocumentItem.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class DocumentListItem: DocumentItem {
    
    private(set) var paragraph: Paragraph?
    private(set) var image: Image?
    private(set) var documentContentType: DocumentContentType
    
    var description: String {
        switch self.documentContentType {
        case .image:
            return "Image: \(image?.path ?? "not found") \(image?.width ?? 0) x \(image?.height ?? 0)\n"
        case .paragraph:
            return "Paragraph: \"\(paragraph?.text ?? "paragraph text not found")\"\n"
        }
    }
    
    init(paragraph: Paragraph) {
        self.documentContentType = .paragraph
        self.paragraph = paragraph
    }
    
    init(image: Image) {
        documentContentType = .image
        self.image = image
    }

}
