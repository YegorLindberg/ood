//
//  AddHarmonicViewController.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 01/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit


protocol AddHarmonicDelegate: class {
    var pointsCount: Int { get }
    var step: Double { get }
    var selectedIndex: IndexPath? { get set }
    var harmonicListViewModel: HarmonicListViewModel { get set }
    func addDismissKeyboardButton() -> UIToolbar
    func checkTextFieldForNumber(_ textField: UITextField) -> Double?
    func reloadTableRow(by index: IndexPath)
    func reloadSelectedView()
    func hideViewAddHarmonic(_ hide: Bool)
}

class AddHarmonicViewController: UIViewController {

    
    @IBOutlet weak var textFieldAmplitude: UITextField!
    @IBOutlet weak var textFieldFrequency: UITextField!
    @IBOutlet weak var textFieldPhase: UITextField!
    @IBOutlet weak var labelFormula: UILabel!
    
    
    var delegate: AddHarmonicDelegate?
    var newTrigonometricFunc  = TrigonometricFunc.sin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetFieldsToAdd()
    }
    
    @IBAction func onOKButtonTouch(_ sender: UIButton) {
        guard let amplitude = self.delegate?.checkTextFieldForNumber(self.textFieldAmplitude) else { return }
        guard let frequency = self.delegate?.checkTextFieldForNumber(self.textFieldFrequency) else { return }
        guard let phase = self.delegate?.checkTextFieldForNumber(self.textFieldPhase) else { return }
        let newHarmonic = HarmonicViewModel(harmonic: Harmonic(amplitude: amplitude, frequency: frequency, phase: phase, trigonometricFunc: self.newTrigonometricFunc))
        newHarmonic.bind {
            self.delegate?.harmonicListViewModel.calculatePoints(points: self.delegate?.pointsCount ?? 0, step: self.delegate?.step ?? 0)
            newHarmonic.updateFormula()
            self.delegate?.reloadTableRow(by: self.delegate?.selectedIndex ?? IndexPath(row: 0, section: 0))
            self.delegate?.reloadSelectedView()
        }
        self.delegate?.harmonicListViewModel.harmonicVMs.append(newHarmonic)
        self.clearAddingView()
    }
    
    @IBAction func onCancelButtonTouch(_ sender: UIButton) {
        self.clearAddingView()
    }
    
    @IBAction func selectNewTrigonometricFuncSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.newTrigonometricFunc = TrigonometricFunc.sin
        case 1:
            self.newTrigonometricFunc = TrigonometricFunc.cos
        default:
            break
        }
        self.labelFormula.text = "\(self.textFieldAmplitude.text!) * \(self.newTrigonometricFunc)(\(self.textFieldFrequency.text!) * x + \(self.textFieldPhase.text!))"
    }
    
    private func clearAddingView() {
        self.delegate?.hideViewAddHarmonic(true)
        self.resetFieldsToAdd()
    }
    
    func resetFieldsToAdd() {
        self.textFieldAmplitude?.text = "1"
        self.textFieldFrequency?.text = "2"
        self.textFieldPhase?.text = "0"
        self.labelFormula?.text = "1 * Sin(2 * x + 0)"
    }

}

extension AddHarmonicViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = self.delegate?.addDismissKeyboardButton()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard self.delegate?.checkTextFieldForNumber(self.textFieldAmplitude) != nil else { return }
        guard self.delegate?.checkTextFieldForNumber(self.textFieldFrequency) != nil else { return }
        guard self.delegate?.checkTextFieldForNumber(self.textFieldPhase) != nil else { return }
        self.labelFormula.text = "\(self.textFieldAmplitude.text!) * \(self.newTrigonometricFunc)(\(self.textFieldFrequency.text!) * x + \(self.textFieldPhase.text!))"
        textField.resignFirstResponder()
    }
    
}
