//
//  ScreenViewController.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 11/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit


class ScreenViewController: UIViewController, DisplayHarmonicChartAndTableDelegate {

    @IBOutlet var AddNewHarmonicViewContainer      : UIView!
    @IBOutlet var displayChartAndTableViewContainer: UIView!
    @IBOutlet var selectedHarmonicViewContainer    : UIView!
    @IBOutlet var harmonicsTableViewContainer      : UIView!
    
    var selectedHarmonicVC             = SelectedHarmonicViewController()
    var addHarmonicVC                  = AddHarmonicViewController()
    var harmonicsTableVC               = HarmonicsTableViewController()
    var displayHarmonicChartAndTableVC = DisplayHarmonicChartAndTableVC()
    
    var harmonicListViewModel = HarmonicListViewModel()
    
    let pointsCount = 1000
    let step = 0.01
    
    var selectedIndex: IndexPath? {
        didSet {
            self.selectedHarmonicVC.resetVariableFields()
            self.selectedHarmonicViewContainer.isHidden = self.selectedIndex == nil ? true : false
            self.harmonicsTableVC.buttonDelete.isHidden = self.selectedIndex == nil ? true : false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeChildrenVCs()

        self.AddNewHarmonicViewContainer.isHidden = true
        self.selectedHarmonicViewContainer.isHidden = true
        
        self.harmonicListViewModel.onAddNewHarmonic = {
            self.harmonicListViewModel.calculatePoints(points: self.pointsCount, step: self.step)
            self.harmonicsTableVC.reloadTableView()
            self.displayHarmonicChartAndTableVC.reloadSelectedView()
        }
        print("app running")
    }
    
    private func initializeChildrenVCs() {
        for child in self.children {
            if child is SelectedHarmonicViewController {
                self.selectedHarmonicVC = child as! SelectedHarmonicViewController
            } else if child is AddHarmonicViewController {
                self.addHarmonicVC = child as! AddHarmonicViewController
            } else if child is HarmonicsTableViewController {
                self.harmonicsTableVC = child as! HarmonicsTableViewController
            } else if child is DisplayHarmonicChartAndTableVC {
                self.displayHarmonicChartAndTableVC = child as! DisplayHarmonicChartAndTableVC
            }
        }
        self.selectedHarmonicVC.delegate = self
        self.addHarmonicVC.delegate = self
        self.harmonicsTableVC.delegate = self
        self.displayHarmonicChartAndTableVC.delegate = self
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
}

extension ScreenViewController: SelectedHarmonicDelegate {
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

extension ScreenViewController: AddHarmonicDelegate {
    func reloadSelectedView() {
        self.displayHarmonicChartAndTableVC.reloadSelectedView()
    }
    
    func reloadTableRow(by index: IndexPath) {
        self.harmonicsTableVC.reloadTableRow(by: index)
    }
}

extension ScreenViewController: HarmonicsTableViewDelegate {
    func hideViewAddHarmonic(_ hide: Bool) {
        self.AddNewHarmonicViewContainer.isHidden = hide
    }
    
    func prepareHarmonicViews(indexPath: IndexPath) {
        self.harmonicsTableViewContainer.isHidden = false
        self.selectedHarmonicVC.prepareViews(harmonicVM: self.harmonicListViewModel.harmonicVMs[indexPath.row])
    }
}
