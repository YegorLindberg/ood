//
//  main.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


var wd = WeatherData(withName: "weatherStation")
var wd1 = WeatherData(withName: "anotherWeatherStation")

var displayCurrent = DisplayCurrentValues()
var displayCurrent1 = DisplayCurrentValues()
var displayStatistic = Display()
var displayStatistic1 = Display()

wd.addObserver(displayStatistic, withPriority: 10)
wd.addObserver(displayCurrent, withPriority: 20)
wd1.addObserver(displayStatistic1, withPriority: 10)
wd1.addObserver(displayCurrent1, withPriority: 20)




wd.setMeasurements(data: WeatherInfo(temperature: 3, humidity: 0.3, pressure: 760))
//wd.setMeasurements(data: WeatherInfo(temperature: 5, humidity: 0.7, pressure: 761))
//
//wd.removeObserver(display)
//
//wd.setMeasurements(data: WeatherInfo(temperature: 10, humidity: 0.7, pressure: 761))
//wd.setMeasurements(data: WeatherInfo(temperature: -10, humidity: 0.7, pressure: 761))


wd1.setMeasurements(data: WeatherInfo(temperature: 24, humidity: 0.1, pressure: 765))

