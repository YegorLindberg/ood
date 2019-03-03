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
        if let temp = data.weatherInfo.temperature {
            print("Current Temperature: \(temp)")
        }
        if let humidity = data.weatherInfo.humidity {
            print("Current Humidity: \(humidity)")
        }
        if let pressure = data.weatherInfo.pressure {
            print("Current Pressure: \(pressure)")
        }
        if let windSpeed = data.weatherInfo.windSpeed {
            print("Current wind speed: \(windSpeed)")
        }
        if let windDirection = data.weatherInfo.windDirection {
            print("Current wind direction: \(windDirection)")
        }
        print("--------------------")
    }
}
