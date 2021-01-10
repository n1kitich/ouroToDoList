//
//  Model.swift
//  OuroToDoList
//
//  Created by Anon Account on 06.01.2021.
//

import Foundation

var ToDoList: [[String: Any]] = [["Name": "", "isCompleted": false]]


func addItem(nameItem: String, isComplited: Bool = true) {
    ToDoList.append(["Name": nameItem, "isCompleted": isComplited])
    saveData()
}

func removeItem(at index: Int) {
    ToDoList.remove(at: index)
    saveData()
}

func saveData() {
    
}

func loadData() {
    
}
