//
//  SelectedHarmonicViewController.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 01/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit


protocol SelectedHarmonicDelegate: class {
    var selectedIndex: IndexPath? { get set }
    var harmonicListViewModel: HarmonicListViewModel { get set }
    func checkTextFieldForNumber(_ textField: UITextField) -> Double?
    func addDismissKeyboardButton() -> UIToolbar
}

class SelectedHarmonicViewController: UIViewController {
    
    @IBOutlet var textFieldAmplitudeEdit: UITextField!
    @IBOutlet var textFieldFrequencyEdit: UITextField!
    @IBOutlet var textFieldPhaseEdit    : UITextField!
    @IBOutlet var segmentedCtrlSinCos   : UISegmentedControl!
    
    var delegate: SelectedHarmonicDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetVariableFields()
    }
    
    func resetVariableFields() {
        self.textFieldAmplitudeEdit.layer.borderColor = UIColor.clear.cgColor
        self.textFieldFrequencyEdit.layer.borderColor = UIColor.clear.cgColor
        self.textFieldPhaseEdit.layer.borderColor     = UIColor.clear.cgColor
    }
    
    func prepareViews(harmonicVM: HarmonicViewModel) {
        self.textFieldAmplitudeEdit.text = "\(harmonicVM.harmonic.amplitude)"
        self.textFieldFrequencyEdit.text = "\(harmonicVM.harmonic.frequency)"
        self.textFieldPhaseEdit.text = "\(harmonicVM.harmonic.phase)"
        self.segmentedCtrlSinCos.selectedSegmentIndex = harmonicVM.harmonic.trigonometricFunc == TrigonometricFunc.sin ? 0 : 1
    }
    
    @IBAction func changeTrigonometricFuncSegmentedControl(_ sender: UISegmentedControl) {
        guard let index = self.delegate?.selectedIndex else {
            print("selected index is nil")
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.trigonometricFunc = TrigonometricFunc.sin
        case 1:
            self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.trigonometricFunc = TrigonometricFunc.cos
        default:
            break
        }
    }

}


extension SelectedHarmonicViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = self.delegate?.addDismissKeyboardButton()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let index = self.delegate?.selectedIndex else {
            print("Err: selected index not found")
            return
        }
        switch textField {
        case self.textFieldAmplitudeEdit:
            guard let value = self.delegate?.checkTextFieldForNumber(self.textFieldAmplitudeEdit) else { return }
            if self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.amplitude != value {
                self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.amplitude = value
            }
            
        case self.textFieldFrequencyEdit:
            guard let value = self.delegate?.checkTextFieldForNumber(self.textFieldFrequencyEdit) else { return }
            if self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.frequency != value {
                self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.frequency = value
            }
            
        case self.textFieldPhaseEdit:
            guard let value = self.delegate?.checkTextFieldForNumber(self.textFieldPhaseEdit) else { return }
            if self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.phase != value {
                self.delegate?.harmonicListViewModel.harmonicVMs[index.row].harmonic.phase = value
            }
            
        default:
            break
        }
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
