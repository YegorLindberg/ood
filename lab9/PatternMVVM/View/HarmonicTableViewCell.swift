//
//  HarmonicTableViewCell.swift
//  PatternMVVM
//
//  Created by Yegor Lindberg on 12/05/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//
import UIKit


class HarmonicTableViewCell: UITableViewCell {
    
    @IBOutlet var labelFormula: UILabel!
    
    var harmoniсViewModel: HarmonicViewModel? {
        didSet {
            self.labelFormula.text = self.harmoniсViewModel?.formula
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        self.labelFormula.text = ""
    }


}
