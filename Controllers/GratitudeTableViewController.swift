//
//  GratitudeTableViewController.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import EventKitUI
//import YYCalendar

class GratitudeTableViewController: UITableViewController {
  
    var selectedCell : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
                
        
        
        //Add Event to Calendar
//        // 1
//        let eventStore = EKEventStore()
//
//        // 2
//        switch EKEventStore.authorizationStatus(for: .event) {
//        case .authorized:
//            insertEvent(store: eventStore)
//        case .denied:
//            print("Access denied")
//        case .notDetermined:
//            // 3
//            eventStore.requestAccess(to: .event, completion:
//                {[weak self] (granted: Bool, error: Error?) -> Void in
//                    if granted {
//                        self!.insertEvent(store: eventStore)
//                    } else {
//                        print("Access denied")
//                    }
//            })
//        default:
//            print("Case default")
//        }
        
    }

    //For Event - Add Gratitude
//    func insertEvent(store: EKEventStore) {
//        // 1
//        let calendars = store.calendars(for: .event)
//
//        for calendar in calendars {
//            // 2
//            if calendar.title == "ioscreator" {
//                // 3
//                let startDate = Date()
//                // 2 hours
//                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
//
//                // 4
//                let event = EKEvent(eventStore: store)
//                event.calendar = calendar
//
//                event.title = "New Meeting"
//                event.startDate = startDate
//                event.endDate = endDate
//
//                // 5
//                do {
//                    try store.save(event, span: .thisEvent)
//                }
//                catch {
//                    print("Error saving event in calendar")             }
//            }
//        }
//    }
    
    /* ------ Reloading Screen ----- */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (section == 0) ? fixed.count : gratitudes.count        
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let gratitudeName = (indexPath.section == 0) ? fixed[indexPath.row].name : gratitudes[indexPath.row].name
        let gratitudeDate = (indexPath.section == 0) ? configuredate.string(from: fixed[indexPath.row].date) : configuredate.string(from: gratitudes[indexPath.row].date)
        if fixed[indexPath.row].date == Date().yesterday {
            cell.textLabel?.text = gratitudeName == "" ? "Yesterday, I'm grateful for \(gratitudeName)" : "I'm grateful for \(gratitudeName)"
        } else {
            cell.textLabel?.text = gratitudeName == "" ? "Today, I'm grateful for \(gratitudeName)" : "I'm grateful for \(gratitudeName)"
        }
        
        cell.detailTextLabel?.text = "\(gratitudeDate)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedCell = indexPath.row
        if indexPath.section == 0 {
            selectedCell = indexPath.row
            performSegue(withIdentifier: "fixedgratitudes", sender: nil)
        }
//        else {
//            performSegue(withIdentifier: "gratitudes", sender: nil)
//        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /* ------ Configurations for delete ----- */
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return indexPath.section == 0 ? .none : .delete
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            gratitudes.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
    
    /* ------ Adding title at section ----- */
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titleShow = ""
        if section == 1 {
            if gratitudes.isEmpty {
                titleShow = ""
            } else {
                titleShow = "My Gratitudes:"
            }
        } else {
            titleShow = ""
        }
        return titleShow
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
        
        if segue.identifier == "fixedgratitudes" {
            let destinationVC = segue.destination as! GratitudeDetailViewController
            if selectedCell == 0 {
                destinationVC.dayWeek = "Today"
            } else {
                destinationVC.dayWeek = "Yesterday"
                destinationVC.day = Date().yesterday
            }
        }
        
        if segue.identifier == "gratitudes" {
            
        }
    }
    

}
