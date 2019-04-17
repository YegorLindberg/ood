//
//  Historible.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 15/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Executor {
    func addAndExecute(command: Commandable)
}
