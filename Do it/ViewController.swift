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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableview.dataSource = self
        tableview.delegate = self
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
            cell.textLabel?.text = " ‼️ \(task.name)"
        }else {
            
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "GoToDetails", sender: tasks[indexPath.row])
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        performSegue(withIdentifier: "addNewText", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender
        print(sender)
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousViewController = self
    }
    func makeTasks () -> [Task]{
        let Task1 = Task()
        Task1.name = "Do Gabby"
        Task1.important = true
        let Task2 = Task()
        Task2.name = "Feed Rhodey"
        let task3 = Task()
        task3.name = "Move to Phoenix"
        
        return [Task1, Task2, task3]
    }
    
}

