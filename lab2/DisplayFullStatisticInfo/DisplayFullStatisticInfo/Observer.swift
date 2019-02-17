//
//  Observer.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class Observer<T> {
    func update(data: T){
        fatalError("Observer<T>, func update(_ data: T) - Should be overriden")
    }
}

protocol Observable: class {
    associatedtype ObservableArgType
    
    func addObserver(_ observer: Observer<ObservableArgType>)
    func removeObserver(_ observer: Observer<ObservableArgType>)
    func notifyObservers()
}

class ObservableUnit<T>: Observable {
    typealias ObservableArgType = T

    private var observers = NSMutableSet()

    func addObserver(_ observer: Observer<T>) {
        self.observers.add(observer)
    }
    
    func removeObserver(_ observer: Observer<T>) {
        self.observers.remove(observer)
    }

    func notifyObservers() {
        let data: T = GetChangedData()
        for observer in self.observers {
            (observer as? Observer<T>)?.update(data: data)
        }
    }

    func GetChangedData() -> T { return T?.self as! T }

}
