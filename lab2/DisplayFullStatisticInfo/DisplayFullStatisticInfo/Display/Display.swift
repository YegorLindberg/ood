//
//  Display.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 18/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


class Display: Observer {
    
    var weatherData: WeatherData
    var priority: Int
    
    init (observable: WeatherData, priority: Int = 10) {
        self.weatherData = observable
        self.priority    = priority
        self.weatherData.addObserver(ObserverUnit(observer: self, priority: self.priority))
    }
    
    func update(from: Observable) {
        update(data: weatherData)
    }
    
    private var temperatureSensor = CalculateSensor()
    private var humiditySensor    = CalculateSensor()
    private var pressureSensor    = CalculateSensor()
    
    final private func update(data: WeatherData) {
        if let temp = data.weatherInfo.temperature,
           let humidity = data.weatherInfo.humidity,
           let pressure = data.weatherInfo.pressure {
            
            self.temperatureSensor.updateStatistic(val: temp)
            self.humiditySensor.updateStatistic(val: humidity)
            self.pressureSensor.updateStatistic(val: pressure)
            print("Got statistic data from \"\(data.identifier)\"")
            printSensors()
        }
    }

    final func resetSensors() {
        self.temperatureSensor.resetSensorsStatistic()
        self.humiditySensor.resetSensorsStatistic()
        self.pressureSensor.resetSensorsStatistic()
    }
    
    final func printSensors(sensors: Set<SensorType> = Set(SensorType.allCases)) {
        if sensors.contains(.Temperature) {
            print("Temperature sensor:")
            printSensorInfo(temperatureSensor)
        }
        if sensors.contains(.Pressure) {
            print("Pressure sensor:")
            printSensorInfo(pressureSensor)
        }
        if sensors.contains(.Humidity) {
            print("Humidity sensor:")
            printSensorInfo(humiditySensor)
        }
        print("--------------------")
    }
    
    
    final private func printSensorInfo(_ sensor: CalculateSensor) {
        print("Min: \(sensor.getMinVal())")
        print("Max: \(sensor.getMaxVal())")
        print("Average: \(sensor.getAvgVal())")
        print()
    }
    
}
