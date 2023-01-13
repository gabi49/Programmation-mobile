//
//  EntryViewController.swift
//  TodolistFinal
//
//  Created by Gabriel Kameni on 10/01/2023.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        field1.delegate = self
        field2.delegate = self
        datePicker.setDate(Date(), animated: true) // set the datePicker to be the date by default
        
        // Do any additional setup after loading the view.
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(//saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        return  true
    }
    
    var newTask : Todo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        newTask = Todo(title: field1.text!, desc: field2.text!, date : datePicker.date)
    }

}
