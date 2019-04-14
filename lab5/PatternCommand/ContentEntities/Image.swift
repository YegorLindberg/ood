//
//  Image.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 06/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Image {
    var width: Int { get }
    var height: Int { get }
    var path: String { get }
    func resize(width: Int, height: Int)
}
