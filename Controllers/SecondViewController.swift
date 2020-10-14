//
//  SecondViewController.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation
class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
//PAUSE
    @IBAction func pause(_ sender: UIButton) {
        if audioStuffed == true && audioPlayer.isPlaying
        {
            audioPlayer.pause()
        }      }
    
//PLAY
    @IBAction func play(_ sender: UIButton) {
        
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }    }
    
   //PREVIOUS
    
    @IBAction func prev(_ sender: UIButton) {
         if thisSong != 0 && audioStuffed == true
               {
                 
                playThis(thisOne: sounds[thisSong-1])
                   thisSong -= 1
                   label.text = sounds[thisSong]
               }
               else
               {
                   
               }
           }
    
//NEXT
    
    @IBAction func next(_ sender: UIButton) {
         if thisSong < sounds.count-1 && audioStuffed == true
               {
                   playThis(thisOne: sounds[thisSong+1])
                   thisSong += 1
                   label.text = sounds[thisSong]
               }
               else
               {
                   
               }    }
    

     func playThis(thisOne:String)
       {
           do
           {
               let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
               try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
               audioPlayer.play()
           }
           catch
           {
               print ("ERROR")
           }
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
