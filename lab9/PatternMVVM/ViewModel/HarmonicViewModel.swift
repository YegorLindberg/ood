//
//  HarmonicViewModel.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 01/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation
import Charts


class HarmonicViewModel {
    var harmonic: Harmonic
    private(set) var formula : String = ""
    private(set) var points = [ChartDataEntry]()
    
    var pointsCount = 1000
    var step = 0.01
    
    init(harmonic: Harmonic) {
        self.harmonic = harmonic
        self.formula   = "\(harmonic.amplitude) * \(harmonic.trigonometricFunc.rawValue == 0 ? "sin" : "cos")(\(harmonic.frequency) * x + \(harmonic.phase))"
        self.calculateHarmonicPoints()
    }
    
    func updateFormula() {
        self.formula   = "\(self.harmonic.amplitude) * \(self.harmonic.trigonometricFunc.rawValue == 0 ? "sin" : "cos")(\(self.harmonic.frequency) * x + \(self.harmonic.phase))"
    }
    
    func bind(listener: Listener?) {
        self.harmonic.listener = {
            self.updateFormula()
            self.calculateHarmonicPoints()
            listener?()
        }
    }
    
    private func calculateHarmonicPoints() {
        self.points = [ChartDataEntry]()
        for i in 0...(self.pointsCount - 1) {
            let x = Double(i) * self.step
            let y = self.getYPoint(by: x)
            
            self.points.append(ChartDataEntry(x: x, y: y))
        }
    }
    
    private func getYPoint(by x: Double) -> Double {
        let angle = self.harmonic.frequency * x + self.harmonic.phase
        let harmonicFunc = self.harmonic.trigonometricFunc == TrigonometricFunc.sin ? sin(angle) : cos(angle)
        return self.harmonic.amplitude * harmonicFunc
    }
    
}
