//
//  Image.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 06/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Image {
    // Возвращает путь относительно каталога документа
    func getPath() -> String
    func getWidth() -> Int
    func getHeight() -> Int
    func resize(width: Int, height: Int)
}
