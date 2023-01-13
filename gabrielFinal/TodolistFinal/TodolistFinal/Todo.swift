//
//  Todo.swift
//  TodolistFinal
//
//  Created by Gabriel Kameni on 23/11/2022.
//

import Foundation


class Todo{
    var title: String
    var desc: String
    var date: Date //= Date()
    //var date: Date
    
    init(title: String, desc: String , date: Date) {
        self.title = title
        self.desc = desc
        self.date = date
        
    }
}
