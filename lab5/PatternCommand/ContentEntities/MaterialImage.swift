//
//  MaterialImage.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 07/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

class MaterialImage: Image {
    private let maxWidth = 10_000
    private let maxHeight = 10_000
    
    private(set) var width: Int
    private(set) var height: Int
    private(set) var path: String
    
    init(path: String, width: Int, height: Int) {
        self.path = path
        self.width = width > maxWidth ? maxWidth : width
        self.height = height > maxHeight ? maxHeight : height
    }
    
    func getPath() -> String {
        return self.path
    }
    
    func getWidth() -> Int {
        return self.width
    }
    
    func getHeight() -> Int {
        return self.height
    }
    
    func resize(width: Int, height: Int) {
        self.width = width > maxWidth ? maxWidth : width
        self.height = height > maxHeight ? maxHeight : height
    }
    
    
}
