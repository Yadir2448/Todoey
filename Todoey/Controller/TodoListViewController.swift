//
//  ViewController.swift
//  Todoey
//
//  Created by Yadir Jimenez on 4/26/18.
//  Copyright © 2018 YadirJ. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Finish coarse"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Make Money"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Publish App"
        itemArray.append(newItem3)
        
        
        if let items = defaults.array(forKey: "todoListArray") as? [Item] {

            itemArray = items
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

// mark - table view datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
      
        
        
        return cell
        
    }
    
    
    //Mark - table view delegate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
    
        tableView.reloadData()
       
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    // mark - add new items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once you click add button
            
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "todoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    }

    
    


