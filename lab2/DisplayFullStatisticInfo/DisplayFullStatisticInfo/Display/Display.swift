//
//  Display.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 18/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


class Display: Observer<WeatherInfo> {
    
    private var tempSensor = CalculateSensor()
    private var humiditySensor = CalculateSensor()
    private var pressureSensor = CalculateSensor()
    
    override func update(data: WeatherInfo, from station: ObservableUnit<WeatherInfo>) {
        self.tempSensor.updateStatistic(val: data.temperature)
        self.humiditySensor.updateStatistic(val: data.humidity)
        self.pressureSensor.updateStatistic(val: data.pressure)
        print("Got statistic data from \(station.identifier)")
        printSensors()
    }

    final func resetSensors() {
        self.tempSensor.resetSensorsStatistic()
        self.humiditySensor.resetSensorsStatistic()
        self.pressureSensor.resetSensorsStatistic()
    }
    
    final func printSensors(sensors: Set<SensorType> = Set(SensorType.allCases)) {
        if sensors.contains(.Temperature) {
            print("Temperature sensor:")
            printSensorInfo(tempSensor)
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
    
    
    private func printSensorInfo(_ sensor: CalculateSensor) {
        print("Min: \(sensor.getMinVal())")
        print("Max: \(sensor.getMaxVal())")
        print("Average: \(sensor.getAvgVal())")
        print()
    }
    
}
