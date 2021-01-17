//
//  TableTableViewController.swift
//  OuroToDoList
//
//  Created by Anon Account on 06.01.2021.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView() // - убирает лишние подчеркивания строк
    }

    @IBAction func pushAction(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Create new shedule", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
        }
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in }
        
        let createAlertAction = UIAlertAction(title: "Create", style: .default) { (alert) in
            let newShedule = alertController.textFields![0].text
            addItem(nameItem: newShedule!)
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAlertAction)
        alertController.addAction(createAlertAction)
        present(alertController, animated: true, completion: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let currentItem = ToDoList[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {  // replace with a class or struct
            cell.imageView?.image = UIImage(named: "check")
        } else {
            cell.imageView?.image = UIImage(named: "uncheck")
        }
        
        if tableView.isEditing {
            //navigationItem.rightBarButtonItem?.title = "Done"
            editButton.tintColor = .systemGreen
            cell.textLabel?.alpha = 0.4
            cell.imageView?.alpha = 0.4
        } else {
            //editButton.title = "Edit"
            editButton.tintColor = .systemBlue
            cell.textLabel?.alpha = 1
            cell.imageView?.alpha = 1
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //editButton.title = "Done"
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        changeState(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .fade)
    }


    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .none
        } else {
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }


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
