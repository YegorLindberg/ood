//
//  WindSensor.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 24/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class WindSensor: Observer<WeatherInfo> {
    
    private var windSpeedSensor = CalculateSensor()
    private var dirX = CalculateSensor()
    private var dirY = CalculateSensor()
    
    override func update(data: WeatherInfo, from station: ObservableUnit<WeatherInfo>) {
        if data.windChanged {
            self.windSpeedSensor.updateStatistic(val: data.windSpeed!)
            let vector = Vector(direction: data.windDirection!)
            self.dirX.updateStatistic(val: vector.x)
            self.dirY.updateStatistic(val: vector.y)
            print("Got statistic data from \(station.identifier)")
            printSensors()
        }
    }
    
    final func resetSensors() {
        self.windSpeedSensor.resetSensorsStatistic()
        self.dirX.resetSensorsStatistic()
        self.dirY.resetSensorsStatistic()
    }
    
    final func printSensors(sensors: Set<SensorType> = Set(SensorType.allCases)) {
        if sensors.contains(.WindSpeed) {
            print("Wind Speed sensor:")
            printSensorInfo(windSpeedSensor)
        }
        if sensors.contains(.WindDirection) {
            print("Wind Direction sensor:")
            print("Min direction: \(Float(calculateDirection(x: self.dirX.getMinVal(), y: self.dirY.getMinVal())))")
            print("Max direction: \(Float(calculateDirection(x: self.dirX.getMaxVal(), y: self.dirY.getMaxVal())))")
            print("Average direction: \(Float(calculateDirection(x: self.dirX.getAvgVal(), y: self.dirY.getAvgVal())))")
            print()
        }
        print("--------------------")
    }
    
    private func calculateDirection(x: Double, y: Double) -> Double {
        let hypotenuse = sqrt(x * x + y * y)
        let multiplier = 1 / hypotenuse
        var direction = acos(x * multiplier) * 180 / Double.pi
        if asin(y) < 0 {
            direction = 360 - direction
        }
        return direction
    }
    
    private func printSensorInfo(_ sensor: CalculateSensor) {
        print("Min: \(sensor.getMinVal())")
        print("Max: \(sensor.getMaxVal())")
        print("Average: \(sensor.getAvgVal())")
        print()
    }
    
    
}
