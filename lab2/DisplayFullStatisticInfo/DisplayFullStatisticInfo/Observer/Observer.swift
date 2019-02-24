//
//  Observer.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class Observer<T>: Hashable {
    func update(data: T, from station: ObservableUnit<T>){
        fatalError("Observer<T>, func update(_ data: T) - Should be overriden")
    }
    
    static func == (lhs: Observer<T>, rhs: Observer<T>) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }

}

protocol Observable: class {
    associatedtype ObservableArgType
    
    func addObserver(_ observer: Observer<ObservableArgType>, withPriority priority: Int)
    func removeObserver(_ observer: Observer<ObservableArgType>)
    func notifyObservers()
}

class ObservableUnit<T>: Observable {
    typealias ObservableArgType = T
    
    let identifier: String
    
    init(withName name: String) {
        self.identifier = name
    }

    private var observers = [Observer<T>: Int]()

    func addObserver(_ observer: Observer<T>, withPriority priority: Int = 10) {
        self.observers[observer] = priority
    }
    
    func removeObserver(_ observer: Observer<T>) {
        self.observers.removeValue(forKey: observer)
    }

    func notifyObservers() {
        let data: T = GetChangedData()
        
        for observer in self.observers.keys.sorted(by: { self.observers[$0]! > self.observers[$1]! }) {
            observer.update(data: data, from: self)
        }
    }

    func GetChangedData() -> T { return T?.self as! T }

}
