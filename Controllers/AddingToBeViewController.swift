//
//  AddingToBeViewController.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class AddingToBeViewController: UIViewController {
    
    var textString: String?
    var isEdit: Bool = false
    var checktobe: Bool = false
    var index: Int?
    @IBOutlet weak var tvToBE: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tvToBE.text = textString ?? ""
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
        if tvToBE.text != "" && !isEdit{
            tobelist.append(ToBe(name: tvToBE.text, check: checktobe))
            NSLog("Add note to tobe: \(tvToBE.text!)")
        } else if tvToBE.text != "" {
            tobelist[index!] = ToBe(name: tvToBE.text, check: checktobe)
        }
    }
}
