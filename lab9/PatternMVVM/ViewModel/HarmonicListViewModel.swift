//
//  HarmonicViewModel.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 19/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import Foundation
import Charts


class HarmonicListViewModel {
    
    init() {}

    var onAddNewHarmonic: Listener?
    private(set) var points = [ChartDataEntry]()
    private(set) var harmonicVMs = [HarmonicViewModel]() {
        didSet {
            self.calculatePoints()
            self.onAddNewHarmonic?()
        }
    }
    
    func append(_ newHarmonic: HarmonicViewModel, _ listener: Listener?) {
        newHarmonic.bind {
            self.calculatePoints()
            listener?()
        }
        self.harmonicVMs.append(newHarmonic)
    }
    
    func remove(by index: Int) {
        self.harmonicVMs.remove(at: index)
    }
    
    private func calculatePoints() {
        self.points = [ChartDataEntry]()
        guard self.harmonicVMs.count > 0 else { return }
        for i in 0...(self.harmonicVMs[0].pointsCount - 1) {
            let y = getSumY(by: i)
            self.points.append(ChartDataEntry(x: self.harmonicVMs[0].points[i].x, y: y))
        }
        print("points calculated")
    }
    
    private func getSumY(by index: Int) -> Double {
        var result = 0.0
        for harmonic in self.harmonicVMs {
            result += harmonic.points[index].y
        }
        return result
    }
    
    
}
