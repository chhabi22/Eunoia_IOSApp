//
//  GratitudeDetailViewController.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class GratitudeDetailViewController: UIViewController {

    var isEdit : Bool = false
    var dayWeek : String?
    var day : Date = Date()
    var gratitude : String?
    var index : Int?
    @IBOutlet weak var lbDay: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
 
        lbDay.text = dayWeek ?? ""
        tvDescription.text = gratitude ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillDisappear(_ animated: Bool) {
        if lbDay.text != "" && tvDescription.text != "" && !isEdit {
            gratitudes.append(Gratitude(name: tvDescription.text, date: day))
            NSLog("Add Gratidude: \(tvDescription.text!)")
        } else if lbDay.text != "" && tvDescription.text != "" {
            gratitudes[index!] = Gratitude(name: tvDescription.text, date: day)
        }
    }

}
