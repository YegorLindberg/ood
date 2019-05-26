//
//  HarmonicViewModel.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 19/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import Foundation


class HarmonicViewModel {
    
    init() {}
    
    var delegate: ScreenViewController?
    var onAddNewHarmonic: (() -> Void)?
    var points = [Point]()
    var harmonics = [Harmonic]() {
        didSet {
            self.onAddNewHarmonic?()
        }
    }
    
    func calculatePoints(points count: Int, step: Double) {
        self.points = [Point]()
        for i in 0...count {
            let x = Double(i) * step
            let y = getSumY(by: x)
            
            self.points.append(Point(x: x, y: y))
        }
        print("points calculated")
    }
    
    private func getSumY(by x: Double) -> Double {
        var result = 0.0
        for harmonic in self.harmonics {
            result += getYPoint(by: x, harmonic: harmonic)
        }
        return result
    }
    
    private func getYPoint(by x: Double, harmonic: Harmonic) -> Double {
        let angle = harmonic.frequency * x + harmonic.phase
        let harmonicFunc = harmonic.trigonometricFunc == TrigonometricFunc.sin ? sin(angle) : cos(angle)
        return harmonic.amplitude * harmonicFunc
    }
}
