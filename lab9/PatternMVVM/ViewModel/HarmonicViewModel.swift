//
//  HarmonicViewModel.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 19/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import Foundation

class HarmonicViewModel {
    
    var delegate: ScreenViewController?
    var onAddNewHarmonic: (() -> Void)?
    
    var harmonics = [Harmonic]() {
        didSet {
            self.onAddNewHarmonic?()
        }
    }
    
    var points = [Point]()
    
    init() {}
    
    func calculatePoint(by index: Int) {
        var x = 0
        var y = 0
        
        
        self.savePoint(by: index, point: Point(x: x, y: y))
    }
    
    private func savePoint(by index: Int, point: Point) {
        if index >= self.points.count {
            self.points.append(point)
        } else {
            self.points[index] = point
        }
    }
}
