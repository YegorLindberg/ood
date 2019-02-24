//
//  DisplayCurrentValues.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 16/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class DisplayCurrentValues: Observer<WeatherInfo> {
    
    override func update(data: WeatherInfo, from station: ObservableUnit<WeatherInfo>) {
        print("Got current data from \"\(station.identifier)\"")
        if let temp = data.temperature {
            print("Current Temperature: \(temp)")
        }
        if let humidity = data.humidity {
            print("Current Humidity: \(humidity)")
        }
        if let pressure = data.pressure {
            print("Current Pressure: \(pressure)")
        }
        if data.windSpeed != nil {
            print("Current wind speed: \(data.windSpeed!)")
            print("Current wind direction: \(data.windDirection!)")
        }
        print("--------------------")
    }
}
