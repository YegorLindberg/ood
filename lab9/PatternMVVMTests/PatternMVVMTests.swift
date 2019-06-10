//
//  PatternMVVMTests.swift
//  PatternMVVMTests
//
//  Created by Yegor Lindberg on 11/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import XCTest
@testable import PatternMVVM

class PatternMVVMTests: XCTestCase {

    func testModelHarmonic() {
        let harmonic = Harmonic(amplitude: 1, frequency: 2, phase: 0, trigonometricFunc: TrigonometricFunc.sin)
        var integer = 0
        harmonic.listener = {
            integer += 1
        }
        XCTAssert(integer == 0)
        
        harmonic.amplitude = 3.0
        harmonic.frequency = 4.0
        XCTAssert(integer == 2)
        
        harmonic.phase = 0.5
        harmonic.trigonometricFunc = .cos
        XCTAssert(integer == 4)
    }
    
    func testHarmonicViewModel() {
        let harmonic = Harmonic(amplitude: 1, frequency: 2, phase: 0, trigonometricFunc: .sin)
        let harmonicVM = HarmonicViewModel(harmonic: harmonic)
        
        harmonicVM.bind {
            harmonicVM.updateFormula()
        }
        XCTAssert(harmonicVM.formula == "1.0 * sin(2.0 * x + 0.0)")
        
        harmonicVM.harmonic.amplitude = 3.0
        harmonicVM.harmonic.frequency = 4.0
        XCTAssert(harmonicVM.formula == "3.0 * sin(4.0 * x + 0.0)")
        
        harmonicVM.harmonic.phase = 0.5
        harmonicVM.harmonic.trigonometricFunc = .cos
        XCTAssert(harmonicVM.formula == "3.0 * cos(4.0 * x + 0.5)")
    }
    
    func testHarmonicListViewModel() {
        let firstHarmonic = Harmonic(amplitude: 1, frequency: 2, phase: 0, trigonometricFunc: .sin)
        
        let firstHarmonicVM = HarmonicViewModel(harmonic: firstHarmonic)
        firstHarmonicVM.pointsCount = 3
        var testVar: Int = 0
        
        let harmonicListVM = HarmonicListViewModel()
        harmonicListVM.onAddNewHarmonic = {
            testVar += 1
        }
        XCTAssert(testVar == 0)
        XCTAssert(harmonicListVM.harmonicVMs.count == 0)
        XCTAssert(harmonicListVM.points.count == 0)
        
        harmonicListVM.append(firstHarmonicVM, { testVar += 1 })
        XCTAssert(testVar == 1)
        harmonicListVM.harmonicVMs[0].harmonic.amplitude = 2
        XCTAssert(testVar == 2)
        XCTAssert(harmonicListVM.harmonicVMs.count == 1)
        print(harmonicListVM.points.count, " - points count")
        XCTAssert(harmonicListVM.points.count == 1000)
        
        XCTAssert(harmonicListVM.points[0].x == 0)
        XCTAssert(harmonicListVM.points[1].x == 0.01)
        XCTAssert(harmonicListVM.points[2].x == 0.02)
        
        XCTAssert(harmonicListVM.points[0].y == 0)
        XCTAssert(Float(harmonicListVM.points[1].y) == 0.01999866669)
//        XCTAssert(Float(harmonicListVM.points[2].y) == )
    }
    
}
