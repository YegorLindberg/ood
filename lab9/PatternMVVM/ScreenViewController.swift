//
//  ScreenViewController.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 11/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit
import Charts


class ScreenViewController: UIViewController, ChartViewDelegate {
    //MARK: - Editing variables group
    @IBOutlet var textFieldAmplitudeEdit: UITextField!
    @IBOutlet var textFieldFrequencyEdit: UITextField!
    @IBOutlet var textFieldPhaseEdit    : UITextField!
    @IBOutlet var segmentedCtrlSinCos   : UISegmentedControl!
    //MARK: - Adding variables group
    @IBOutlet var textFieldApmlitude: UITextField!
    @IBOutlet var textFieldFrequency: UITextField!
    @IBOutlet var textFieldPhase    : UITextField!
    @IBOutlet var labelFormula      : UILabel!
    //MARK: - Views variables group
    @IBOutlet var viewGraphic         : LineChartView!
    @IBOutlet var viewPoints          : UIView!
    @IBOutlet var viewAddHarmonic     : UIView!
    @IBOutlet var tableViewHarmonics  : UITableView!
    @IBOutlet var tableViewPoints     : UITableView!
    @IBOutlet var viewSelectedHarmonic: UIView!
    
    
    //MARK: - VC variables
    private var harmonicViewModel    = HarmonicViewModel()
    private var newTrigonometricFunc = TrigonometricFunc.sin
    
    var pointsCount = 100
    var step = 1.0
    
    private var selectedIndex: IndexPath? {
        didSet {
            self.resetVariableFields()
            self.viewSelectedHarmonic.isHidden = self.selectedIndex == nil ? true : false
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewAddHarmonic.isHidden = true
        self.harmonicViewModel.delegate = self
        self.viewGraphic.delegate = self
        self.lineChartUpdate()
        self.harmonicViewModel.onAddNewHarmonic = {
            self.harmonicViewModel.calculatePoints(points: self.pointsCount, step: self.step)
            self.reloadTableView()
            self.lineChartUpdate()
        }
        print("app running")
        resetFieldsToAdd()
    }
    
    func addDismissKeyboardButton() -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "╳", style: .done, target: self, action: #selector(self.endEditing))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        return toolbar
    }
    
    @objc func endEditing() {
        self.view.endEditing(true)
    }

    //MARK: - Actions processing
    @IBAction func changeTrigonometricFuncSegmentedControl(_ sender: UISegmentedControl) {
        guard let index = self.selectedIndex else {
            print("selected index is nil")
            return
        }
        switch sender.selectedSegmentIndex {
        case 0:
            self.harmonicViewModel.harmonics[index.row].trigonometricFunc = TrigonometricFunc.sin
        case 1:
            self.harmonicViewModel.harmonics[index.row].trigonometricFunc = TrigonometricFunc.cos
        default:
            break
        }
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
        self.labelFormula.text = "\(self.textFieldApmlitude.text!) * \(self.newTrigonometricFunc)(\(self.textFieldFrequency.text!) * x + \(self.textFieldPhase.text!))"
    }
    
    @IBAction func selectedViewSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.viewPoints.isHidden = true
        case 1:
            self.tableViewPoints.reloadData()
            self.viewPoints.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func onAddNewButtonTouch(_ sender: UIButton) {
        self.viewAddHarmonic.isHidden = false
        self.selectedIndex = nil
    }
    
    @IBAction func onDeleteSelectedButtonTouch(_ sender: UIButton) {
        if self.selectedIndex != nil {
            self.harmonicViewModel.harmonics.remove(at: self.selectedIndex!.row)
            self.tableViewHarmonics.reloadData()
        }
    }
    
    @IBAction func onOKButtonTouch(_ sender: UIButton) {
        guard let amplitude = self.checkTextFieldForNumber(self.textFieldApmlitude) else { return }
        guard let frequency = self.checkTextFieldForNumber(self.textFieldFrequency) else { return }
        guard let phase = self.checkTextFieldForNumber(self.textFieldPhase) else { return }
        let newHarmonic = Harmonic(amplitude: amplitude, frequency: frequency, phase: phase, trigonometricFunc: self.newTrigonometricFunc)
        newHarmonic.bind {
            self.harmonicViewModel.calculatePoints(points: self.pointsCount, step: self.step)
            self.reloadTableRow(by: self.selectedIndex ?? IndexPath(row: 0, section: 0))
            self.lineChartUpdate()
        }
        self.harmonicViewModel.harmonics.append(newHarmonic)
        clearAddingView()
    }
    
    @IBAction func onCancelButtonTouch(_ sender: UIButton) {
        clearAddingView()
    }
    
    //MARK: - Reset Views
    private func lineChartUpdate() {
        let set = LineChartDataSet(values: self.harmonicViewModel.points, label: "Harmonics")
        let data = LineChartData(dataSet: set)
        
        self.viewGraphic.legend.form = .square
        self.viewGraphic.data = data
    }
    
    private func resetVariableFields() {
        self.textFieldAmplitudeEdit.layer.borderColor = UIColor.clear.cgColor
        self.textFieldFrequencyEdit.layer.borderColor = UIColor.clear.cgColor
        self.textFieldPhaseEdit.layer.borderColor     = UIColor.clear.cgColor
    }
    
    private func resetFieldsToAdd() {
        self.textFieldApmlitude.text = "1"
        self.textFieldFrequency.text = "2"
        self.textFieldPhase.text = "0"
        self.labelFormula.text = "1 * Sin(2 * x + 0)"
    }
    
    private func clearAddingView() {
        self.viewAddHarmonic.isHidden = true
        resetFieldsToAdd()
    }
    
}

//MARK: - TableView processing
extension ScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableViewHarmonics {
            return self.harmonicViewModel.harmonics.count
        } else if tableView == self.tableViewPoints {
            return self.harmonicViewModel.points.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableViewHarmonics {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "harmonicCell") as? HarmonicTableViewCell else {
                return UITableViewCell()
            }
            cell.harmoniс = self.harmonicViewModel.harmonics[indexPath.row]
            return cell
        } else if tableView == self.tableViewPoints {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "pointCell") as? PointTableViewCell else {
                return UITableViewCell()
            }
            cell.point = self.harmonicViewModel.points[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.tableViewHarmonics {
            self.selectedIndex = indexPath
            self.textFieldAmplitudeEdit.text = "\(self.harmonicViewModel.harmonics[indexPath.row].amplitude)"
            self.textFieldFrequencyEdit.text = "\(self.harmonicViewModel.harmonics[indexPath.row].frequency)"
            self.textFieldPhaseEdit.text = "\(self.harmonicViewModel.harmonics[indexPath.row].phase)"
            self.segmentedCtrlSinCos.selectedSegmentIndex = self.harmonicViewModel.harmonics[indexPath.row].trigonometricFunc == TrigonometricFunc.sin ? 0 : 1
        }
    }
    
    private func reloadTableView() {
        self.tableViewHarmonics.reloadData()
        self.selectedIndex = nil
    }
    
    private func reloadTableRow(by index: IndexPath) {
        self.tableViewHarmonics.reloadRows(at: [index], with: .none)
        self.tableViewHarmonics.selectRow(at: index, animated: false, scrollPosition: .top)
    }
}

//MARK: - TextField processing
extension ScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = self.addDismissKeyboardButton()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let index = self.selectedIndex else {
            guard self.checkTextFieldForNumber(self.textFieldApmlitude) != nil else { return }
            guard self.checkTextFieldForNumber(self.textFieldFrequency) != nil else { return }
            guard self.checkTextFieldForNumber(self.textFieldPhase) != nil else { return }
            self.labelFormula.text = "\(self.textFieldApmlitude.text!) * \(self.newTrigonometricFunc)(\(self.textFieldFrequency.text!) * x + \(self.textFieldPhase.text!))"
            textField.resignFirstResponder()
            return
        }
        switch textField {
        case self.textFieldAmplitudeEdit:
            guard let value = self.checkTextFieldForNumber(self.textFieldAmplitudeEdit) else { return }
            self.harmonicViewModel.harmonics[index.row].amplitude = value
            
        case self.textFieldFrequencyEdit:
            guard let value = self.checkTextFieldForNumber(self.textFieldFrequencyEdit) else { return }
            self.harmonicViewModel.harmonics[index.row].frequency = value
            
        case self.textFieldPhaseEdit:
            guard let value = self.checkTextFieldForNumber(self.textFieldPhaseEdit) else { return }
            self.harmonicViewModel.harmonics[index.row].phase = value
            
        default:
            break
        }
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func checkTextFieldForNumber(_ textField: UITextField) -> Double? {
        guard let value = Double(textField.text!) else {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.red.cgColor
            return nil
        }
        textField.layer.borderColor = UIColor.clear.cgColor
        return value
    }
}
