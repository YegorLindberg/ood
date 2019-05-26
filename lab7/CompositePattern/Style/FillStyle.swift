//
//  FillStyle.swift
//  CompositePattern
//
//  Created by Yegor Lindberg on 21/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit

class FillStyle {
    var isEnabled: Bool
    var color: UIColor
    
    init(isEnabled: Bool = true, color: UIColor = UIColor(red: CGFloat(1/255.0), green: CGFloat(1/255.0), blue: CGFloat(1/255.0), alpha: CGFloat(1.0))) {
        self.isEnabled = isEnabled
        self.color = color
    }
}
