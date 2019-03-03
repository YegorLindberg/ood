//
//  Observer.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


protocol Observer: class {
    func update(from: Observable)
}


protocol Observable: class {
    func addObserver(_ observer: ObserverUnit)
    func removeObserver(_ observer: ObserverUnit)
    func notifyObservers()
}


class ObserverUnit {
    
    var observer: Observer!
    var priority: Int = 10
    
    init(observer: Observer, priority: Int) {
        self.observer = observer
        self.priority = priority
    }
    
}


class ObservableUnit<T>: Observable {
    
    let identifier: String
    
    init(withName name: String) {
        self.identifier = name
    }
    
    private var observers = [ObserverUnit]()
    
    func addObserver(_ observer: ObserverUnit) {
        self.observers.append(observer)
        self.observers = self.observers.sorted(by: { $0.priority > $1.priority })
        for unit in self.observers {
            print(unit.priority)
        }
        print()
    }
    
    func removeObserver(_ observer: ObserverUnit) {
        if let index = self.observers.firstIndex(where: { (item) -> Bool in observer === item }) {
            self.observers.remove(at: index)
        }
    }

    func notifyObservers() {
        for unit in self.observers {
            unit.observer.update(from: self)
        }
    }

}
