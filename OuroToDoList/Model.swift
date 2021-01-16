//
//  Model.swift
//  OuroToDoList
//
//  Created by Anon Account on 06.01.2021.
//

import Foundation

var ToDoList: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoData")
        UserDefaults.standard.synchronize()
    }
    get {
        if let list = UserDefaults.standard.array(forKey: "ToDoData") as? [[String: Any]] {
            return list
        } else {  return [] }
    }
}

func addItem(nameItem: String, isComplited: Bool = false) {
    ToDoList.append(["Name": nameItem, "isCompleted": isComplited])
}

func removeItem(at index: Int) {
    ToDoList.remove(at: index)
}

func changeState(at item: Int) {
    ToDoList[item]["isCompleted"] = !(ToDoList[item]["isCompleted"] as! Bool)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoList[fromIndex]
    ToDoList.remove(at: fromIndex)
    ToDoList.insert(from, at: toIndex)
}
