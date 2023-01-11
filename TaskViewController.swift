//
//  TaskViewController.swift
//  TodolistFinal
//
//  Created by Gabriel Kameni on 10/01/2023.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var dateP: UILabel!
 
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter .dateStyle = .medium
        return dateFormatter
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = data {
            titre.text = task.title
            desc.text = task.desc
            dateP.text = Self.dateFormatter.string(from: task.date)
                                                   
        } else{
            titre.text="ERROR 404"
        }
        

        // Do any additional setup after loading the view.
    }
    
    var data: Todo?
    


}
