//
//  CheckBox.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-18.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "checked_ic.png")! as UIImage
    let uncheckedImage = UIImage(named: "ic_check_box_outline_blank.png")! as UIImage
        
    // Bool property
    var isChecked: Bool? {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }

    @objc func buttonClicked(sender: UIButton) {
//        if isChecked == nil { isChecked = false }
        if sender == self {
            isChecked = !isChecked!
        }
    }
}
// var checkbox = CheckBox()
