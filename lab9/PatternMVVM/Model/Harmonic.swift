//
//  Harmonic.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 12/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
typealias Listener = () -> Void

class Harmonic {
    var listener  : Listener?
    var amplitude : Double {
        didSet {
            listener?()
        }
    }
    var frequency: Double {
        didSet {
            listener?()
        }
    }
    var phase: Double {
        didSet {
            listener?()
        }
    }
    var trigonometricFunc: TrigonometricFunc {
        didSet {
            listener?()
        }
    }
    
    init(amplitude: Double, frequency: Double, phase: Double, trigonometricFunc: TrigonometricFunc) {
        self.amplitude = amplitude
        self.frequency = frequency
        self.phase     = phase
        self.trigonometricFunc = trigonometricFunc
    }

}
