//
//  PointTableViewCell.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 27/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit
import Charts


class PointTableViewCell: UITableViewCell {

    @IBOutlet var labelX: UILabel!
    @IBOutlet var labelY: UILabel!
    
    var point: ChartDataEntry? {
        didSet {
            self.labelX.text = String(point?.x ?? 0.0)
            self.labelY.text = String(point?.y ?? 0.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
