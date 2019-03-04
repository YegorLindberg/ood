//
//  DisplayCurrentValues.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class DisplayCurrentValues: Observer {
    
    var weatherData: WeatherData
    var priority: Int
    
    init (observable: WeatherData, priority: Int = 10) {
        self.weatherData = observable
        self.priority    = priority
        self.weatherData.addObserver(ObserverUnit(observer: self, priority: self.priority))
    }
    
    func update(from: Observable) {
        update(data: self.weatherData)
    }
    
    func update(data: WeatherData) {
        print("Got current data from \"\(data.identifier)\"")
        print("Current Temperature: \(data.weatherInfo.temperature)")
        print("Current Humidity: \(data.weatherInfo.humidity)")
        print("Current Pressure: \(data.weatherInfo.pressure)")
        if let windSpeed = data.weatherInfo.windSpeed {
            print("Current wind speed: \(windSpeed)")
        }
        if let windDirection = data.weatherInfo.windDirection {
            print("Current wind direction: \(windDirection)")
        }
        print("--------------------")
    }
}
