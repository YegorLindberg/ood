//
//  WeatherData.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


struct WeatherInfo {
    
    var temperature: Double = 0
    var    humidity: Double = 0
    var    pressure: Double = 0
    
    init() {}
    
    init(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }

}

class WeatherData: ObservableUnit<WeatherInfo> {
    
    private var weatherInfo = WeatherInfo()
    
    private var temperature = 0.0
    private var    humidity = 0.0
    private var    pressure = 760.0
    
    func getTemperature() -> Double {
        return self.temperature
    }
    
    func getHumidity() -> Double {
        return self.humidity
    }
    
    func getPressure() -> Double {
        return self.pressure
    }
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    func setMeasurements(data: WeatherInfo) {
        self.temperature = data.temperature
        self.humidity    = data.humidity
        self.pressure    = data.pressure
        measurementsChanged()
    }
    
    override func GetChangedData() -> WeatherInfo {
        var info = WeatherInfo()
        info.temperature = getTemperature()
        info.humidity    = getHumidity()
        info.pressure    = getPressure()
        return info
    }
    
}
