//
//  WeatherData.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


struct WeatherInfo {
    
    var temperature: Double?
    var    humidity: Double?
    var    pressure: Double?
    
    var     windSpeed: Double?
    var windDirection: Double?
    
    var windChanged = false
    
    init() {}
    
    init(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }
    
    init(windSpeed: Double, windDirection: Double) {
        self.windSpeed = windSpeed
        self.windDirection = windDirection
        self.windChanged = true
    }

}

class WeatherData: ObservableUnit<WeatherInfo> {
    
    private var weatherInfo = WeatherInfo()
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    func setMeasurements(data: WeatherInfo) {
        if data.windChanged {
            self.weatherInfo.windSpeed     = data.windSpeed!
            self.weatherInfo.windDirection = data.windDirection!
            self.weatherInfo.windChanged = true
        } else {
            self.weatherInfo.temperature = data.temperature!
            self.weatherInfo.humidity    = data.humidity!
            self.weatherInfo.pressure    = data.pressure!
            self.weatherInfo.windChanged = false
        }
        measurementsChanged()
    }
    
    override func GetChangedData() -> WeatherInfo {
        return self.weatherInfo
    }
    
}
