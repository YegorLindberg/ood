//
//  main.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


var wd = WeatherData()

var display = Display()
wd.addObserver(display)

var statsDisplay = StatsDisplay()
wd.addObserver(statsDisplay)

wd.setMeasurements(temperature: 3, humidity: 0.3, pressure: 760)
wd.setMeasurements(temperature: 5, humidity: 0.7, pressure: 761)

wd.removeObserver(display)

wd.setMeasurements(temperature: 10, humidity: 0.7, pressure: 761)
wd.setMeasurements(temperature: -10, humidity: 0.7, pressure: 761)
