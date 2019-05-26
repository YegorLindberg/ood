//
//  Harmonic.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 12/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//


class Harmonic {
    typealias Listener = (Int) -> Void
    var listener  : Listener?
    var formula   : String = ""
    var amplitude : Int {
        didSet {
            self.updateFormula()
            listener?(amplitude)
        }
    }
    var frequency: Int {
        didSet {
            self.updateFormula()
            listener?(frequency)
        }
    }
    var phase: Int {
        didSet {
            self.updateFormula()
            listener?(phase)
        }
    }
    var trigonometricFunc: TrigonometricFunc {
        didSet {
            self.updateFormula()
            listener?(trigonometricFunc.rawValue)
        }
    }
    
    init(amplitude: Int, frequency: Int, phase: Int, trigonometricFunc: TrigonometricFunc) {
        self.amplitude = amplitude
        self.frequency = frequency
        self.phase     = phase
        self.trigonometricFunc = trigonometricFunc
        self.formula   = "\(amplitude) * \(trigonometricFunc.rawValue == 0 ? "sin" : "cos")(\(frequency) * x + \(phase))"
    }
    
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    private func updateFormula() {
        self.formula = "\(self.amplitude) * \(self.trigonometricFunc.rawValue == 0 ? "sin" : "cos")(\(self.frequency) * x + \(self.phase))"
    }
}
