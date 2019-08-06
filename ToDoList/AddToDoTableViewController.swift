//
//  AddToDoTableViewController.swift
//  ToDoList
//
//  Created by Дмитрий Беседин on 7/9/19.
//  Copyright © 2019 DmytroBesedin. All rights reserved.
//

import UIKit
import  Firebase


class AddToDoTableViewController: UITableViewController {
    var isPass = false
    var dateInterval: TimeInterval = 0
    
    
    
    @IBOutlet weak var nameTextFieldOutlet: UITextField!
    
    @IBOutlet weak var descriptionTextFieldOutlet: UITextField!
    
    @IBOutlet weak var dateOfComplitTextFieldOutlet: UITextField!
    
    @IBOutlet weak var dateOfComplitDatePickerOutlet: UIDatePicker!
    
    @IBOutlet weak var isComplitSwitchOutlet: UISwitch!{
        didSet {
            if isComplitSwitchOutlet.isOn {
                isPass = true
            }
            else{
                isPass = false
            }
        }
    }
    
    
    let toDoList = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // subscribe delegate
        
        nameTextFieldOutlet.delegate = self
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveBarButtonItemAction))
     
    }
    // MARK: - Acion
    
    @IBAction func isComplitSwitchAction(_ sender: Any) {
     //   isComplitSwitchOutlet.isOn ? isPass = true : isPass = false
        if isComplitSwitchOutlet.isOn {isPass = true}
        else{isPass = false}
    }
    
    @IBAction func dateOfComplitAction(_ sender: Any) {
         // add to memmory for douwnload date
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextFieldOutlet.becomeFirstResponder()
        descriptionTextFieldOutlet.becomeFirstResponder()
        
        
    }
    
    // MARK: - SaveButton
     @objc func saveBarButtonItemAction(){
        guard let name = nameTextFieldOutlet.text else{return}
        guard let description = descriptionTextFieldOutlet.text else{return}
        guard let dateOfComplit = dateOfComplitTextFieldOutlet.text else{return}

        if (!name.isEmpty && !description.isEmpty){
            let ref = Database.database().reference()
            let toDoUid = ref.childByAutoId()
        guard   let uidToDoKey = toDoUid.key else{return}
    
            
            let newToDo: [String:Any] = ["uidToDo": uidToDoKey, "name": name, "description": description, "dateOfComplit": 2.333, "isComplit": isPass]
            toDoUid.setValue(newToDo)
         
            var currentViewControllerArray = self.navigationController?.viewControllers
            currentViewControllerArray?.removeLast()
            guard let newController = currentViewControllerArray else{return}
            self.navigationController?.viewControllers = newController
//            self.navigationController?.pushViewController(addToDoContoller, animated: true)
            self.dismiss(animated: false, completion: nil)
        }
        else{
            
            print("some trobless ")
        }

      
    }

    
    
    
    // MARK: - loadview
    func loadViewController() {
    
    }
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//        
//    }
//    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddToDoTableViewController: UITextFieldDelegate{
    
}
