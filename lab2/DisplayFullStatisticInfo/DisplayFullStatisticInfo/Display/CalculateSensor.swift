//
//  CalculateSensors.swift
//  DisplayFullStatisticInfo
//
//  Created by Yegor Lindberg on 17/02/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


class CalculateSensor {
    
    private var  minValue =  Double.infinity
    private var  maxValue = -Double.infinity
    private var sumValues = 0.0
    private var  countAvg = 0
    
    final func getMinVal() -> Double {
        return self.minValue
    }
    
    final func getMaxVal() -> Double {
        return self.maxValue
    }
    
    final func getAvgVal() -> Double {
        guard countAvg != 0 else {
            return Double.infinity
        }
        return (self.sumValues / Double(self.countAvg))
    }

    final func updateStatistic(val: Double) {
        self.minValue = min(self.minValue, val)
        self.maxValue = max(self.maxValue, val)
        self.sumValues += val
        countAvg += 1
    }
    
    final func resetSensorsStatistic() {
        self.minValue =  Double.infinity
        self.maxValue = -Double.infinity
        self.sumValues = 0
        self.countAvg = 0
    }
    
}
