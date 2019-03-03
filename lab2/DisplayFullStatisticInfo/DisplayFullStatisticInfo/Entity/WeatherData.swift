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
    
    func setMeasurements(data: WeatherInfo) {
        self.weatherInfo.windSpeed     = data.windSpeed ?? self.weatherInfo.windSpeed
        self.weatherInfo.windDirection = data.windDirection ?? self.weatherInfo.windDirection
        self.weatherInfo.temperature   = data.temperature ?? self.weatherInfo.temperature
        self.weatherInfo.humidity      = data.humidity ?? self.weatherInfo.humidity
        self.weatherInfo.pressure      = data.pressure ?? self.weatherInfo.pressure
        
        notifyObservers()
    }
    
}
