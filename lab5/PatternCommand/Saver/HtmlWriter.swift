//
//  HtmlWriter.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 14/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import Foundation


class HtmlWriter {
    private var title = ""
    private var bodyItems = [DocumentItem]()
    
    init(documentTitle: String, bodyItems: [DocumentItem], path: String) {
        self.title = documentTitle
        self.bodyItems = bodyItems
        self.save(path: path)
    }
    
    func save(path: String) {
        let home = FileManager.default.homeDirectoryForCurrentUser
        let docUrl = home.appendingPathComponent(path)
        print(docUrl.path)
        
        let htmlDocument = composeHtml()
        do {
            try htmlDocument.write(to: docUrl, atomically: false, encoding: .utf8)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func composeHtml() -> String {
        return """
        <!DOCTYPE html>
        <html lang="en" dir="ltr">
        <head>
        <meta charset="utf-8">
        <title>\(self.title)</title>
        </head>
        <body>
        \(printHtmlBody())
        </body>
        </html>
        """
    }
    
    func printHtmlBody() -> String {
        var body = ""
        for (index, item) in bodyItems.enumerated() {
            switch item.documentContentType {
            case .paragraph:
                body += "<p>\(index). \(item.paragraph!.getText())</p>\n"
                break
            case .image:
                //--
                break
            }
        }
        return body
    }
}
