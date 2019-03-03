//
//  main.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


var wd = WeatherData(name: "On street")
var displayCurrent = DisplayCurrentValues(observable: wd)

wd.setMeasurements(data: WeatherInfo(windSpeed: 5, windDirection: 10))
wd.setMeasurements(data: WeatherInfo(temperature: 24, humidity: 0.5, pressure: 760))

print(); print()

var calcSensors = Display(observable: wd, priority: 20)
wd.setMeasurements(data: WeatherInfo(temperature: 20, humidity: 0.5, pressure: 760))
wd.setMeasurements(data: WeatherInfo(temperature: 24, humidity: 0.6, pressure: 762))
wd.setMeasurements(data: WeatherInfo(temperature: 30, humidity: 0.8, pressure: 766))


var wd1 = WeatherData(name: "In room")
var dispCurr1 = DisplayCurrentValues(observable: wd1)
wd1.setMeasurements(data: WeatherInfo(temperature: 21, humidity: 0.4, pressure: 759))
wd1.setMeasurements(data: WeatherInfo(temperature: 21, humidity: 0.4, pressure: 759))


