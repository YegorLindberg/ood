//
//  MaterialDocument.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class DocumentList: Document {
    var title: String = ""
    private var oldTitle = ""
    
    private var items = [DocumentItem]()
    private var history = History()
    
    func insertParagraph(text: String, position: UInt?) {
        let actualPosition = position != nil ? Int(position!) : items.count
        let paragraph = ListParagraph(text: text)
        let docItem = DocumentListItem(paragraph: paragraph)
        
        self.history.addAndExecute(command: Command(onExecute: { self.items.insert(docItem, at: actualPosition) },
                                                    onUnexecute: { self.items.remove(at: actualPosition) }))
    }
    
    func editParagraph(text: String, position: Int) {
        let paragraph = self.items[position].paragraph
        let oldValue = paragraph?.getText()
        self.history.addAndExecute(command: Command(onExecute: { paragraph?.setText(newText: text) },
                                                    onUnexecute: { paragraph?.setText(newText: oldValue!) }))
    }

    func insertImage(path: String, width: Int, height: Int, position: UInt?) {
        let actualPosition = position != nil ? Int(position!) : items.count
        let image = ListImage(path: path, width: width, height: height)
        image.resize(width: width, height: height)
        let docItem = DocumentListItem(image: image)
        
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
        let setTitleCommand = SetTitleCommand(document: self, title: title)
        self.history.addAndExecute(command: Command(onExecute: { setTitleCommand.execute() },
                                                    onUnexecute: { setTitleCommand.unexecute() }))
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
        
    }
    
    
}
