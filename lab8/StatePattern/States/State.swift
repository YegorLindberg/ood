//
//  State.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol State: class {
    func insertQuarter()
    func ejectQuarter()
    func turnCrank()
    func dispense()
    func toString() -> String
}
