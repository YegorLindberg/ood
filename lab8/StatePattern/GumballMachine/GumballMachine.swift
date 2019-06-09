//
//  GumballMachine.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 09/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol GumballMachine {
    func releaseBall()
    var ballsCount: UInt { get }
    var insertedQuarters: UInt { get set }
    var maxQuartersCount: UInt { get }
    
    func setSoldOutState()
    func setNoQuarterState()
    func setSoldState()
    func setHasQuarterState()
}
