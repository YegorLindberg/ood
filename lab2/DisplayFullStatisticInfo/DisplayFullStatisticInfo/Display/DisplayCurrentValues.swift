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
        print("Got current data from \(station.identifier)")
        print("Current Temperature: \(data.temperature)")
        print("Current Humidity: \(data.humidity)")
        print("Current Pressure: \(data.pressure)")
        print("--------------------")
    }
}
