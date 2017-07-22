//
//  ViewController.swift
//  Do it
//
//  Created by Zach Butcher on 7/20/17.
//  Copyright © 2017 Zach Butcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    
    var tasks :[Task] = []
    var selectedindex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableview.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        
        if task.important{
            cell.textLabel?.text = " ‼️ \(task.name!)"
        }else {
            
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedindex = indexPath.row
        
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "GoToDetails", sender: tasks[indexPath.row])
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        performSegue(withIdentifier: "addNewText", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == ("GoToDetails"){
            let nextVC = segue.destination as! CompleteTaskViewController
            
            nextVC.task = sender as! Task
            nextVC.selectedindex = selectedindex
        }
        
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try tasks = context.fetch(Task.fetchRequest()) as! [Task]
        }catch{
            
        }
        
    }
}

