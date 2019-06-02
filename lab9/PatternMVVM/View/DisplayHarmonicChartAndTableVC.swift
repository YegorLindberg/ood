//
//  DisplayHarmonicChartAndTableVC.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 01/06/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit
import Charts


protocol DisplayHarmonicChartAndTableDelegate: class {
    var harmonicListViewModel: HarmonicListViewModel { get set }
}

class DisplayHarmonicChartAndTableVC: UIViewController, ChartViewDelegate {
    
    @IBOutlet var selectedViewSC : UISegmentedControl!
    
    @IBOutlet var viewGraphic: LineChartView!
    @IBOutlet var tableViewPoints: UITableView!
    @IBOutlet var viewPoints     : UIView!
    
    var delegate: DisplayHarmonicChartAndTableDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewGraphic.delegate = self
        self.reloadSelectedView()
    }
    
    @IBAction func selectedViewSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.viewPoints.isHidden = true
        case 1:
            self.viewPoints.isHidden = false
        default:
            break
        }
        self.reloadSelectedView()
    }
    
    func reloadSelectedView() {
        switch selectedViewSC.selectedSegmentIndex {
        case 0:
            self.lineChartUpdate()
        case 1:
            self.tableViewPoints.reloadData()
        default:
            break
        }
    }
    
    func lineChartUpdate() {
        if self.delegate?.harmonicListViewModel.points.count ?? 0 > 0 {
            self.viewGraphic.isHidden = false
            let set = LineChartDataSet(values: self.delegate?.harmonicListViewModel.points, label: "Harmonics")
            set.drawFilledEnabled = false
            set.drawCirclesEnabled = false
            set.setDrawHighlightIndicators(false)
            set.setColor(NSUIColor.init(cgColor: UIColor.blue.cgColor), alpha: 1.0)
            set.lineWidth = 1.5
            
            let data = LineChartData(dataSet: set)
            self.viewGraphic.legend.form = .square
            data.setDrawValues(false)
            
            self.viewGraphic.data = data
        } else {
            self.viewGraphic.isHidden = true
        }
    }
    
}

extension DisplayHarmonicChartAndTableVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.delegate?.harmonicListViewModel.points.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pointCell") as? PointTableViewCell else {
            return UITableViewCell()
        }
        cell.point = self.delegate?.harmonicListViewModel.points[indexPath.row]
        return cell
    }
}
