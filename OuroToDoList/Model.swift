//
//  Model.swift
//  OuroToDoList
//
//  Created by Anon Account on 06.01.2021.
//

import Foundation

var ToDoList: [[String: Any]] = [["Name": "///", "isCompleted": true]]


func addItem(nameItem: String, isComplited: Bool = false) {
    ToDoList.append(["Name": nameItem, "isCompleted": isComplited])
    saveData()
}

func removeItem(at index: Int) {
    ToDoList.remove(at: index)
    saveData()
}

func changeState(at item: Int) {
    ToDoList[item]["isCompleted"] = !(ToDoList[item]["isCompleted"] as! Bool)
    saveData()
}

func saveData() {
    
}

func loadData() {
    
}
