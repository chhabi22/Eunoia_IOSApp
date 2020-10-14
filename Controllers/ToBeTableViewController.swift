//
//  ToBeTableViewController.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ToBeTableViewController: UITableViewController {
    
    var selectedCell = 0
    @IBOutlet var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        /* ------ Populate for tests ----- */
//        tobelist.append(ToBe(name: "Travel", check: false))
//        tobelist.append(ToBe(name: "Buy Tickets", check: true))
        
        //Adding at view
        self.addingTableViewCell()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    /* ------ Adding custom tableviewcell ----- */
    func addingTableViewCell(){
        let tobecell = UINib(nibName: "ToBeTableViewCell", bundle: nil)
        self.tableView.register(tobecell, forCellReuseIdentifier: "ToBeTableViewCell")
    }
    
    /* ------ Reloading Screen ----- */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    @objc func setData(sender: UIButton) {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = self.tableView.indexPathForRow(at:buttonPosition)![1]
        tobelist[indexPath].check = !tobelist[indexPath].check
//        let cell = self.tableView.cellForRow(at: indexPath!) as! UITableViewCell
     }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tobelist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToBeTableViewCell", for: indexPath) as? ToBeTableViewCell {
            cell.lbDescription.text = tobelist[indexPath.row].name
            cell.btCheckBox.awakeFromNib()
            cell.btCheckBox.isChecked = tobelist[indexPath.row].check
            cell.btCheckBox.addTarget(self, action:#selector(setData(sender:)), for: UIControl.Event.touchUpInside)
            return cell
        }
        return UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.isEditing ? .none : .delete
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tobelist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = tobelist[sourceIndexPath.row]
        tobelist.remove(at: sourceIndexPath.row)
        tobelist.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = indexPath.row
        performSegue(withIdentifier: "seetobe", sender: nil)
    }
    
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
                
        if (segue.identifier == "createtobe") {
            let destinationVC = segue.destination as! AddingToBeViewController
            destinationVC.isEdit = false
        }
        if (segue.identifier == "seetobe") {
            let destinationVC = segue.destination as! AddingToBeViewController
            destinationVC.isEdit = true
            destinationVC.index = selectedCell
            destinationVC.textString = tobelist[selectedCell].name
        }
        
    }
    
    @IBAction func mixlines(_ sender: Any) {
        tableview.isEditing = !tableview.isEditing
    }
    
}
