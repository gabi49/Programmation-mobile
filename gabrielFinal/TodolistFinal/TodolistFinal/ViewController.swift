//
//  ViewController.swift
//  TodolistFinal
//
//  Created by Gabriel Kameni on 23/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titre.text = tasks[indexPath.row].title
        cell.date.text = TaskViewController.dateFormatter.string(from: tasks[indexPath.row].date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.tasks.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
    
        })
        ])
        
        //updateTasks()
        return configuration
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

    @IBOutlet weak var tableView: UITableView!
     
    var tasks = [Todo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Todo List"
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tasks = self.tasks.sorted(by: {$0.date < $1.date})
        
        // setup
        
        /*if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }*/
        // Get all current save tasks
        //updateTasks()
    }

    /*func updateTasks() {
        //tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? Todo {
               tasks.append(task)
            }
        }
        tableView.reloadData()
        
    }*/
    
    @IBAction func didTapAdd(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            /*DispatchQueue.main.async {
                self.updateTasks()
            }*/
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func unwindToAdd(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
        if let vc = unwindSegue.source as? EntryViewController {
            if let todo = vc.newTask {
                
                tasks.append(todo)
            }
        }
        self.tasks = self.tasks.sorted(by: {$0.date < $1.date})
        tableView.reloadData()
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TaskViewController {
            let row = tableView.indexPathForSelectedRow!.row
            vc.data = tasks[row]
        }
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TaskViewController{
            let row = tableView.indexPathForSelectedRow!.row
            vc.data = tasks[row]
            vc.title = "My Task"
        }
    }
    
    
    
    
    
    
}






