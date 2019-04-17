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
    
    func execute() throws {
        if !self.executed {
            self.executed = true
            self.onExecute()
        } else {
            throw NSError.init(domain: "Can't execute command twice.", code: 1, userInfo: nil)
        }
    }
    
    func unexecute() throws {
        if self.executed {
            self.executed = false
            self.onUnexecute()
        } else {
            throw NSError.init(domain: "Can't unexecute command twice.", code: 2, userInfo: nil)
        }
    }
    
    
}
