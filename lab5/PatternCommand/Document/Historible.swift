//
//  Historible.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 15/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Historible {
    var maxLength: Int { get }
    var commands: [Commandable] { get set }
    var nextCommandIndex: Int { get }
    
    func undo()
    func redo()
    
    func canUndo() -> Bool
    func canRedo() -> Bool
    func addAndExecute(command: Commandable)
}
