//
//  ViewController.swift
//  TodolistFinal
//
//  Created by Gabriel Kameni on 23/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksearch.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titre.text = tasksearch[indexPath.row].title
        cell.date.text = TaskViewController.dateFormatter.string(from: tasksearch[indexPath.row].date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.tasksearch.remove(at: row)
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
    var tasksearch = [Todo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Todo List"
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        self.tasks = self.tasks.sorted(by: {$0.date < $1.date}) //effectue un tri des éléments de notre tableau
        
        tasksearch = tasks
        

    }

    // fonction permettant de cliquer sur le boutton add et d'aller vers la vue EntryViewcontroller
    @IBAction func didTapAdd(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //fonction permettant de sauvegarder une tache
    @IBAction func unwindToAdd(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
        if let vc = unwindSegue.source as? EntryViewController {
            if let todo = vc.newTask {
                
                tasks.append(todo)
               
            }
        }
        self.tasks = self.tasks.sorted(by: {$0.date < $1.date})
        tasksearch = tasks
        tableView.reloadData()
    }
    
    //fonction preparant les informations pour la pochaine vue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TaskViewController{
            let row = tableView.indexPathForSelectedRow!.row
            vc.data = tasksearch[row]
            vc.title = "My Task"
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tasksearch = []
        if searchText == ""{
            tasksearch = tasks
        } else {
            for todo in tasks {
                if todo.title.contains(searchText) {
                    tasksearch.append(todo)
                }
            }
        }
        tableView.reloadData()
    }
    
    
    
    
    
    
}






