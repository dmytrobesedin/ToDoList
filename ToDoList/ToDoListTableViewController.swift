//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Дмитрий Беседин on 7/4/19.
//  Copyright © 2019 DmytroBesedin. All rights reserved.
//

import UIKit
import Firebase




class ToDoListTableViewController: UITableViewController {

    @IBOutlet weak var addToDoOutlet: UIBarButtonItem!
    
    var toDoList = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromFirebase()
        

    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       
    }

    @IBAction func addToDoAction(_ sender: Any) {
        guard let addToDoContoller = self.storyboard?.instantiateViewController(withIdentifier: "AddToDoViewController") else{return}
        self.navigationController?.pushViewController(addToDoContoller, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }
    
    // MARK: - insert data into cell and return
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
             let toDoLister = toDoList[indexPath.row]

        cell.textLabel?.text  = toDoLister.name ?? "name"
        cell.detailTextLabel?.text =   toDoLister.description ?? "description"
        
        return cell

    }
    
    
    
    
    // MARK:  - Load Data From Firebase
    
    func loadDataFromFirebase() {
        let link = Database.database().reference()
       
        link.queryOrdered(byChild:"isComplit").observe(DataEventType.value, with: { (snapshot) in
            var newToDoList = [ToDo]()
            for toDoValue in snapshot.children {
                if let toDoLoop = toDoValue as? DataSnapshot{
                    let newToDoPaper = ToDo(dataSnapshot: toDoLoop)
                    newToDoList.append(newToDoPaper)
                }
            }
            self.toDoList = newToDoList
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
     
        
    }

 

    
}
