//
//  MaterialDocument.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class Document { //Document
    var title: String = ""
    
    private var items = [DocumentItem]()
    var history = History()
    
    func insertParagraph(text: String, position: UInt?) {
        let actualPosition = position != nil ? Int(position!) : items.count
        let paragraph = HtmlParagraph(text: text)
        let docItem = HtmlDocumentItem(paragraph: paragraph)
        
        self.history.addAndExecute(command: Command(onExecute: { self.items.insert(docItem, at: actualPosition) },
                                                    onUnexecute: { self.items.remove(at: actualPosition) }))
    }

    func insertImage(path: String, width: Int, height: Int, position: UInt?) {
        let actualPosition = position != nil ? Int(position!) : items.count
        let image = HtmlImage(path: path, width: width, height: height)
        image.resize(width: width, height: height)
        let docItem = HtmlDocumentItem(image: image)
        
        self.history.addAndExecute(command: Command(onExecute: { self.items.insert(docItem, at: actualPosition) },
                                                    onUnexecute: { self.items.remove(at: actualPosition) }))
    }
    
    func getItemsCount() -> Int {
        return self.items.count
    }
    
    func getItem(at index: Int) -> DocumentItem {
        return self.items[index]
    }
    
    func deleteItem(index: Int) {
        let item = self.items[index]
        
        self.history.addAndExecute(command: Command(onExecute: { self.items.remove(at: index) },
                                                    onUnexecute: { self.items.insert(item, at: index) }))
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setTitle(title: String) {
        let oldTitle = self.title
        
        self.history.addAndExecute(command: Command(onExecute: { self.title = title },
                                                    onUnexecute: { self.title = oldTitle }))
    }
    
    func canUndo() -> Bool {
        return self.history.canUndo()
    }
    
    func undo() {
        self.history.undo()
    }
    
    func canRedo() -> Bool {
        return self.history.canRedo()
    }
    
    func redo() {
        self.history.redo()
    }
    
    func save(path: String) {
        HtmlWriter(documentTitle: self.title, bodyItems: self.items, path: path)
    }
    
    
}
