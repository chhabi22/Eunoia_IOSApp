//
//  Affirmations.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class Affirmations: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
// outlest for buttons, pickerview and label
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectedPickerView: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    // variables
    var second = 17
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    
   // Array of Affirmations
    var affirmations: [String] = ["Happy", "Healthy", "Beautiful", "Confident", "Blessed", "Wealthy"]
    
    
    // loads
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedPickerView.text = ""
        pickerView.dataSource = self

        pickerView.delegate = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return affirmations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let myAffirmations = affirmations[row]
        return myAffirmations
    }
    
    // to show selected affirmation on the label
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerView.text = "\(affirmations[row])"
    }
    
// Start buttton for Timer
    @IBAction func startTapped(_ sender: Any) {
      if  isTimerRunning == false {
            runTimer()
        self.startBtn.isEnabled = false
        }
    }
    
// Puase button for Timer - pasue changes to resume | resume changes to pause
    @IBAction func pauseTapped(_ sender: Any) {
        if self.resumeTapped == false{
            timer.invalidate()
            self.resumeTapped = true
            self.pauseBtn.setTitle("Resume", for: .normal)
        } else
        {
            runTimer()
            self.resumeTapped = false
             self.pauseBtn.setTitle("Pause", for: .normal)        }
    }
    
// Restart Button for Timer
    @IBAction func restartTapped(_ sender: Any) {
        timer.invalidate()
        second = 17
        timerLabel.text = timeString(time: TimeInterval(second))
        isTimerRunning = false
        pauseBtn.isEnabled = false
    }
    
    // FUNCTIONS for Timer
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(Affirmations.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseBtn.isEnabled = true
    }// end of runTimer
    
    
    @objc func updateTimer(){
        if second < 1 {
            timer.invalidate()
        }
        else {
            second -= 1
            timerLabel.text = timeString(time: TimeInterval(second))
        }
    } // end of updateTimer
    
    
    func timeString(time: TimeInterval) -> String{
       let second = Int(time) % 17
        return String(format: "%02i", second)
    } //end of timeString
   
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // end of class
