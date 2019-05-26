//
//  LineStyle.swift
//  CompositePattern
//
//  Created by Yegor Lindberg on 21/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit

class LineStyle {
    var isEnabled: Bool
    var color: UIColor
    var lineWidth: CGFloat
    
    init(isEnabled: Bool = true, color: UIColor = UIColor(red: CGFloat(0/255.0), green: CGFloat(0/255.0), blue: CGFloat(0/255.0), alpha: CGFloat(1.0)), lineWidth: CGFloat = 1.0) {
        self.isEnabled = isEnabled
        self.color = color
        self.lineWidth = lineWidth
    }
}
