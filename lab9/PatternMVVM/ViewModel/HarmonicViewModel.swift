//
//  HarmonicViewModel.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 19/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class HarmonicViewModel {
    var onAddNewHarmonic: (() -> Void)?
    
    var harmonics = [Harmonic]() {
        didSet {
            self.onAddNewHarmonic?()
        }
    }
    
    var points = [Point]()
    
    init() {}
}
