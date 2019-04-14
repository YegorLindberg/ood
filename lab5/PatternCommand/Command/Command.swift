//
//  MaterialCommand.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import Foundation

class Command: Commandable {
    var onExecute: () -> Void
    var onUnexecute: () -> Void
    private var executed = false
    
    init(onExecute: @escaping () -> Void, onUnexecute: @escaping () -> Void) {
        self.onExecute = onExecute
        self.onUnexecute = onUnexecute
    }
    
    func execute() {
        if !self.executed {
            self.executed = true
            self.onExecute()
        }
    }
    
    func unexecute() {
        if self.executed {
            self.executed = false
            self.onUnexecute()
        }
    }
    
    
}
