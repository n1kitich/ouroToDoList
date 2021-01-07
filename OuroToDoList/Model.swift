//
//  Model.swift
//  OuroToDoList
//
//  Created by Anon Account on 06.01.2021.
//

import Foundation

var ToDoList: [String] = ["Tell", "Write"]


func addItem(nameItem: String) {
    ToDoList.append(nameItem)
}

func deleteItem(at index: Int) {
    ToDoList.remove(at: index)
    saveData()
}

func saveData() {
    
}

func loadData() {
    
}
