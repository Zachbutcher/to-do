//
//  CompleteTaskViewController.swift
//  Do it
//
//  Created by Zach Butcher on 7/21/17.
//  Copyright © 2017 Zach Butcher. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var task : Task? = nil
    var selectedindex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important{
            taskNameLabel.text = " ‼️ \(task!.name!)"
        }else {
            
            taskNameLabel.text = task!.name
        }
        taskNameLabel.text = task!.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func completeTask(_ sender: Any) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
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
