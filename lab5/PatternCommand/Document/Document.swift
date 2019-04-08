//
//  Document.swift
//  PatternCommand
//
//  Created by Yegor Lindberg on 06/04/2019.
//  Copyright © 2019 Yegor Lindberg. All rights reserved.
//

protocol Document {
    var title: String { get set }
    
    // Вставляет параграф текста в указанную позицию (сдвигая последующие элементы)
    // Если параметр position не указан, вставка происходит в конец документа
    func insertParagraph(text: String, position: UInt?)
    
    // Вставляет изображение в указанную позицию (сдвигая последующие элементы)
    // Параметр path задает путь к вставляемому изображению
    // При вставке изображение должно копироваться в подкаталог images
    // под автоматически сгенерированным именем
    func insertImage(path: String, width: Int, height: Int, position: UInt?)
    
    func getItemsCount() -> Int
    
    // Доступ к элементам изображения
    func getItem(at index: Int) -> DocumentItem
    
    // Удаляет элемент из документа
    func deleteItem(index: Int)
    
    func getTitle() -> String
    func setTitle(title: String)
    
    // Сообщает о доступности операции Undo
    func canUndo() -> Bool
    // Отменяет команду редактирования
    func undo()
    
    // Сообщает о доступности операции Redo
    func canRedo() -> Bool
    // Выполняет отмененную команду редактирования
    func redo()
    
    // Сохраняет документ в формате html. Изображения сохраняются в подкаталог images.
    // Пути к изображениям указываются относительно пути к сохраняемому HTML файлу
    func save(path: String)
}
