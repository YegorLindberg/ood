//
//  Loggerable.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 11/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Loggerable {
    var logs: [String] { get }
    func addLog(_ log: String)
}
