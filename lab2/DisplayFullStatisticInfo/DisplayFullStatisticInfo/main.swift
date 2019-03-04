////
////  main.swift
////  DisplayFullStatisticInfo
////
////  Created by Yegor Lindberg on 16/02/2019.
////  Copyright © 2019 Yegor Lindberg. All rights reserved.
////
//
//
//var wd = WeatherData(name: "")
//var displayCurrent = DisplayCurrentValues(observable: wd)
////var windSens = WindSensor(observable: wd, priority: 30)
////wd.setMeasurements(data: WeatherInfo(windSpeed: 5, windDirection: 10))
////wd.setMeasurements(data: WeatherInfo(windSpeed: 9, windDirection: 350))
//
//wd.setMeasurements(data: WeatherInfo(temperature: 24, humidity: 0.5, pressure: 760))
//
//print(); print()
//
//var calcSensors = Display(observable: wd, priority: 20)
//wd.setMeasurements(data: WeatherInfo(temperature: 20, humidity: 0.5, pressure: 760))
////wd.setMeasurements(data: WeatherInfo(temperature: 24, humidity: 0.6, pressure: 762))
//wd.setMeasurements(data: WeatherInfo(temperature: 30, humidity: 0.8, pressure: 766))
//
////wd.removeObserver(calcSensors)
//print(); print(); print(); print()
//wd.removeObserver(displayCurrent)
//
//var wd1 = WeatherData(name: "")
//var dispCurr1 = DisplayCurrentValues(observable: wd1)
//wd.setMeasurements(data: WeatherInfo(temperature: 22, humidity: 0.5, pressure: 760))
//print()
//wd1.setMeasurements(data: WeatherInfo(temperature: 21, humidity: 0.4, pressure: 759))
//wd1.setMeasurements(data: WeatherInfo(temperature: 25, humidity: 0.6, pressure: 763))
//
//


var wd = WeatherData(name: "a")
var windSens = WindSensor(observable: wd)
var mainSensors = Display(observable: wd, priority: 10)

print("temperature", wd.getTemperature())
print()
wd.setMeasurements(data: WeatherInfo(windSpeed: 1, windDirection: 0))
wd.setMeasurements(data: WeatherInfo(windSpeed: 1, windDirection: -90))
//wd.setMeasurements(data: WeatherInfo(windSpeed: 1, windDirection: 0))
