//
//  Color.swift
//  Factory
//
//  Created by Yegor Lindberg on 11/03/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

import UIKit

enum Color: String {
    case Red
    case Green
    case Blue
    case Yellow
    case Pink
    case Black
    case Clear
    
    var toUIColor: UIColor {
        switch self {
        case    .Red: return UIColor.red
        case  .Green: return UIColor.green
        case   .Blue: return UIColor.blue
        case .Yellow: return UIColor.yellow
        case   .Pink: return UIColor.magenta
        case  .Black: return UIColor.black
        case  .Clear: return UIColor.clear
        }
    }
    
}
