//
//  Command.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Command {
    func execute()
    func unexecute()
}
