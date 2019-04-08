//
//  App.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class App {
    
    var document = MaterialDocument()
    private var appIsRunning = true
    private var commandDefenitions = [String]()
    
    func run() {
        printHelp()
        while self.appIsRunning {
            print("Enter command > ", terminator: "")
            let commandLine = readLine()
            if commandLine != nil && commandLine != "" {
                self.commandDefenitions = commandLine!.components(separatedBy: " ")
                treatmentCommand()
            } else {
                printException()
            }
        }
    }
    
    func treatmentCommand() {
        if self.commandDefenitions[0] == "exit" {
            self.appIsRunning = false
            return
        } else {
            switch self.commandDefenitions[0] {
            case "insertParagraph":
                insertParagraph()
                break
            case "insertImage":
                break
            case "setTitle":
                setTitle()
                break
            case "list":
                printList()
                break
            case "replaceText":
                
                break
            case "resizeImage":
                break
            case "deleteItem":
                deleteItem()
                break
            case "help":
                printHelp()
                break
            case "undo":
                self.document.undo()
                break
            case "redo":
                self.document.redo()
                break
            case "save":
                break
            default:
                printException()
                break
            }
            
        }
    }
    
    func insertParagraph() {
        let position: UInt = getPosition()
        let text = getText(from: 2)
        
        document.insertParagraph(text: text, position: position)
//        let par = document.getItem(at: Int(position))
//        print(par.description)
    }
    
    func deleteItem() {
        guard let index = Int(self.commandDefenitions[1]) else {
            printException()
            return
        }
        document.deleteItem(index: index)
    }
    
    func setTitle() {
        document.title = getText(from: 1)
//        print(document.getTitle())
    }
    
    func getPosition() -> UInt {
        guard self.commandDefenitions.count == 3, self.self.commandDefenitions[1] != "end", let position = Int(self.commandDefenitions[1]) else {
            return UInt(document.getItemsCount())
        }
        if position >= 0 && position < self.document.getItemsCount() {
            return UInt(position)
        }
        return UInt(document.getItemsCount())
    }
    
    func getText(from index: Int) -> String {
        var text = ""
        for value in commandDefenitions.dropFirst(index) {
            text += value + " "
        }
        text.removeLast()
        return text
    }
    
    func printList() {
        print("Title:", self.document.getTitle())
        if self.document.getItemsCount() != 0 {
            for i in 0...(self.document.getItemsCount() - 1) {
                let item = self.document.getItem(at: i)
                print("\(i). \(item.description)", terminator: "")
            }
        }
    }
    
    
    func printException() {
        print("Invalid command or argument. Enter \"help\" to view instructions.")
//        printHelp()
    }
    
    func printHelp() {
        print("insertParagraph <position>|end <text>")
        print("insertImage <position>|end <width> <height> <path>")
        print("setTitle <title text>")
        print("list")
        print("replaceText <position> <text>")
        print("resizeImage <position> <width> <height>")
        print("deleteItem <position>")
        print("help")
        print("undo")
        print("redo")
        print("save <path>\n\n")
    }
}
