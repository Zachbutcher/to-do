//
//  CreateTaskViewController.swift
//  Do it
//
//  Created by Zach Butcher on 7/21/17.
//  Copyright © 2017 Zach Butcher. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskTextBox: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousViewController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func taskCreatedButton(_ sender: Any) {
        let newTask = Task()
        newTask.important = importantSwitch.isOn
        newTask.name = taskTextBox.text!
        
        previousViewController.tasks.append(newTask)
        previousViewController.tableview.reloadData()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
