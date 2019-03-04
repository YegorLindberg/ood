//
//  WeatherData.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


struct WeatherInfo {
    
    var temperature = 0.0
    var    humidity = 0.0
    var    pressure = 760.0
    
    var     windSpeed: Double?
    var windDirection: Double?
    
    init() {}
    
    init(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity    = humidity
        self.pressure    = pressure
    }
    
    init(windSpeed: Double, windDirection: Double) {
        self.windSpeed     = windSpeed
        self.windDirection = windDirection
    }

}

class WeatherData: ObservableUnit<WeatherInfo> {
    
    var weatherInfo = WeatherInfo()
    
    init(name: String) {
        super.init(withName: name)
    }
    
    func getTemperature() -> Double {
        return weatherInfo.temperature
    }
    
    func getHumidity() -> Double {
        return weatherInfo.humidity
    }
    
    func getPressure() -> Double {
        return weatherInfo.pressure
    }
    
    func setMeasurements(data: WeatherInfo) {
        self.weatherInfo.temperature   = data.temperature
        self.weatherInfo.humidity      = data.humidity
        self.weatherInfo.pressure      = data.pressure
        self.weatherInfo.windSpeed     = data.windSpeed ?? self.weatherInfo.windSpeed
        self.weatherInfo.windDirection = data.windDirection ?? self.weatherInfo.windDirection
        
        notifyObservers()
    }
    
}
