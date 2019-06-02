//
//  HarmonicsTableViewController.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 01/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit


protocol HarmonicsTableViewDelegate: class {
    var selectedIndex: IndexPath? { get set }
    var harmonicListViewModel: HarmonicListViewModel { get set }
    func checkTextFieldForNumber(_ textField: UITextField) -> Double?
    func prepareHarmonicViews(indexPath: IndexPath)
    func hideViewAddHarmonic(_ hide: Bool)
}

class HarmonicsTableViewController: UIViewController {
    
    @IBOutlet var tableViewHarmonics: UITableView!
    @IBOutlet var buttonDelete: UIButton!
    var delegate: HarmonicsTableViewDelegate?
    var index: IndexPath? {
        didSet {
            self.delegate?.selectedIndex = index
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonDelete.isHidden = true
    }
    
    @IBAction func onAddNewButtonTouch(_ sender: UIButton) {
        self.delegate?.hideViewAddHarmonic(false)
        self.index = nil
    }
    
    @IBAction func onDeleteSelectedButtonTouch(_ sender: UIButton) {
        if self.index != nil {
            self.delegate?.harmonicListViewModel.harmonicVMs.remove(at: (self.index?.row)!)
            self.index = nil
            self.tableViewHarmonics.reloadData()
        }
    }

}


extension HarmonicsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.delegate?.harmonicListViewModel.harmonicVMs.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "harmonicCell") as? HarmonicTableViewCell else {
            return UITableViewCell()
        }
        cell.harmoniсViewModel = self.delegate?.harmonicListViewModel.harmonicVMs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.prepareHarmonicViews(indexPath: indexPath)
        self.index = indexPath
    }
    
    func reloadTableView() {
        self.tableViewHarmonics.reloadData()
        self.index = nil
    }
    
    func reloadTableRow(by index: IndexPath) {
        self.tableViewHarmonics.reloadRows(at: [index], with: .none)
        self.tableViewHarmonics.selectRow(at: index, animated: false, scrollPosition: .top)
    }
}
