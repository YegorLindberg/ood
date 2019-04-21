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
    
    var toCGColor: CGColor {
        switch self {
        case    .Red: return UIColor.red.cgColor
        case  .Green: return UIColor.green.cgColor
        case   .Blue: return UIColor.blue.cgColor
        case .Yellow: return UIColor.yellow.cgColor
        case   .Pink: return UIColor.magenta.cgColor
        case  .Black: return UIColor.black.cgColor
        }
    }
    
}
