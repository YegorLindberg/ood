//
//  HarmonicViewModel.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 01/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation


class HarmonicViewModel {
    var harmonic: Harmonic {
        didSet {
            updateFormula()
        }
    }
    var formula : String = ""
    
    init(harmonic: Harmonic) {
        self.harmonic = harmonic
        self.formula   = "\(harmonic.amplitude) * \(harmonic.trigonometricFunc.rawValue == 0 ? "sin" : "cos")(\(harmonic.frequency) * x + \(harmonic.phase))"
    }
    
    func updateFormula() {
        self.formula   = "\(self.harmonic.amplitude) * \(self.harmonic.trigonometricFunc.rawValue == 0 ? "sin" : "cos")(\(self.harmonic.frequency) * x + \(self.harmonic.phase))"
    }
    
    func bind(listener: Listener?) {
        self.harmonic.listener = listener
    }
    
}
