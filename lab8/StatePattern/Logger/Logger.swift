//
//  Logger.swift
//  StatePattern
//
//  Created by Yegor Lindberg on 11/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class Logger: Loggerable {
    private(set) var logs = [String]()
    
    func addLog(_ log: String) {
        self.logs.append(log)
    }
}
