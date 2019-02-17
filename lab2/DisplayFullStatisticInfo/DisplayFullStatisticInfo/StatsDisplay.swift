//
//  StatsDisplay.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class StatsDisplay: Observer<WeatherInfo> {
    
    private var minTemperature: Double = .greatestFiniteMagnitude
    private var maxTemperature: Double = .leastNormalMagnitude
    private var avgTemperature: Double = 0
    private var   countAverage: UInt   = 0
    
    override func update(data: WeatherInfo) {
        if self.minTemperature > data.temperature {
            self.minTemperature = data.temperature
        }
        if maxTemperature < data.temperature {
            maxTemperature = data.temperature
        }
        self.avgTemperature += data.temperature
        self.countAverage += 1
        
        print("Max Temp: \(self.maxTemperature)")
        print("Min Temp: \(self.minTemperature)")
        print("Average Temp: \(self.avgTemperature / Double(self.countAverage))")
        print("----------------")
    }
    
}
