//
//  History.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class History {
    private let maxLength = 10
    private var commands = [Command]()
    private var nextCommandIndex = 0
    
    func canUndo() -> Bool {
        return self.nextCommandIndex != 0
    }
    
    func canRedo() -> Bool {
        return self.nextCommandIndex < self.commands.count
    }
    
    func undo() {
        if canUndo() {
            self.commands[self.nextCommandIndex - 1].unexecute()
            self.nextCommandIndex -= 1
        }
    }
    
    func redo() {
        if canRedo() {
            self.commands[self.nextCommandIndex].execute()
            self.nextCommandIndex += 1
        }
    }
    
    func addAndExecute(command: Command) {
        command.execute()
        self.commands.append(command)
        self.nextCommandIndex += 1
        
        if self.commands.count > self.maxLength {
            self.commands.remove(at: 0)
        }
    }
    
    
}
