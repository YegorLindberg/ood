//
//  UnitTests.swift
//  UnitTests
//
//  Created by Yegor Lindberg on 15/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import XCTest
@testable import PatternCommand


class UnitTests: XCTestCase {

    func testCanUndoRedo() {
        let doc = DocumentList()
        XCTAssertEqual(doc.canUndo(), false)
        XCTAssertEqual(doc.canRedo(), false)
        
        doc.insertParagraph(text: "something", position: 0)
        XCTAssertEqual(doc.canUndo(), true)
        XCTAssertEqual(doc.canRedo(), false)
        
        doc.undo()
        XCTAssertEqual(doc.canUndo(), false)
        XCTAssertEqual(doc.canRedo(), true)
        
        doc.insertParagraph(text: "new", position: UInt(doc.getItemsCount()))
        XCTAssertEqual(doc.canUndo(), true)
        XCTAssertEqual(doc.canRedo(), false)
        
        doc.insertParagraph(text: "middle", position: UInt(doc.getItemsCount()))
        doc.undo()
        XCTAssertEqual(doc.canUndo(), true)
        XCTAssertEqual(doc.canRedo(), true)
    }
    
    func testInsertingParagraphs() {
        let document = DocumentList()
        
        document.insertParagraph(text: "hello", position: 0)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "hello")
        
        document.insertParagraph(text: "bye", position: 1)
        XCTAssertEqual(document.getItem(at: 1).paragraph?.text, "bye")
        
        document.insertParagraph(text: "take a little bit", position: 0)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "take a little bit")
        XCTAssertEqual(document.getItem(at: 1).paragraph?.text, "hello")
        XCTAssertEqual(document.getItem(at: 2).paragraph?.text, "bye")
    }
    
    func testEditingParagraphs() {
        let document = DocumentList()
        document.insertParagraph(text: "hello", position: 0)
        document.insertParagraph(text: "bye", position: 1)
        document.insertParagraph(text: "take a little bit", position: 0)
        
        document.editParagraph(text: "this paragraph was changed", position: 0)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "this paragraph was changed")
        XCTAssertEqual(document.getItem(at: 1).paragraph?.text, "hello")
        XCTAssertEqual(document.getItem(at: 2).paragraph?.text, "bye")
        
        document.editParagraph(text: "this paragraph was changed TOO", position: 1)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "this paragraph was changed")
        XCTAssertEqual(document.getItem(at: 1).paragraph?.text, "this paragraph was changed TOO")
        XCTAssertEqual(document.getItem(at: 2).paragraph?.text, "bye")
        
        document.editParagraph(text: "this paragraph was changed TOO and this is last", position: 2)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "this paragraph was changed")
        XCTAssertEqual(document.getItem(at: 1).paragraph?.text, "this paragraph was changed TOO")
        XCTAssertEqual(document.getItem(at: 2).paragraph?.text, "this paragraph was changed TOO and this is last")
        
        document.editParagraph(text: "rock", position: 0)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "rock")
        document.editParagraph(text: "jazz", position: 0)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "jazz")
        
        document.undo()
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "rock")
        document.undo()
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "this paragraph was changed")
        
        document.redo()
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "rock")
        document.redo()
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "jazz")
    }

    func testSetTitle() {
        let document = DocumentList()
        XCTAssertEqual(document.title, "")
        
        document.setTitle(title: "Lab5")
        XCTAssertEqual(document.title, "Lab5")
        
        document.setTitle(title: "Lab5 is not Lab6")
        XCTAssertEqual(document.title, "Lab5 is not Lab6")
    }
    
    func testDeleteItem() {
        let document = DocumentList()
        document.insertParagraph(text: "hello", position: 0)
        document.insertParagraph(text: "take a little bit", position: 1)
        document.insertParagraph(text: "bye", position: 2)
        
        document.deleteItem(index: 1)
        XCTAssertEqual(document.getItemsCount(), 2)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "hello")
        XCTAssertEqual(document.getItem(at: 1).paragraph?.text, "bye")
        
        document.deleteItem(index: 0)
        XCTAssertEqual(document.getItemsCount(), 1)
        XCTAssertEqual(document.getItem(at: 0).paragraph?.text, "bye")
        
        document.deleteItem(index: 0)
        XCTAssertEqual(document.getItemsCount(), 0)
    }
}
