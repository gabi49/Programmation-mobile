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
        
        //saveTask()
        
        return  true
    }
    
    var newTask : Todo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if let vc = segue.destination
        
        newTask = Todo(title: field1.text!, desc: field2.text!, date : datePicker.date)
    }
   /* @objc func saveTask() {
        guard let text = field1.text, let text2 = field2.text, !text.isEmpty else {
            return
        }
        
        let newTask = Todo(title: text, desc: text2)
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(newTask.title, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }*/


}
