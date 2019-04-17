//
//  DocumentItem.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 06/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol DocumentItem {
    var paragraph: Paragraph? { get }
    var image: Image? { get }
    var documentContentType: DocumentContentType { get }
}
