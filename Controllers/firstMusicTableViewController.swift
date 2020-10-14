//
//  firstMusicTableViewController.swift
//  EunoiaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

//Global Variables
var audioPlayer = AVAudioPlayer()
var sounds:[String] = []
var thisSong = 0
var audioStuffed = false

class firstMusicTableViewController: UITableViewController {

    //Loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // calling function to load the songs
         gettingSongNames()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return sounds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCell", for: indexPath)

       cell.textLabel?.text = sounds[indexPath.row]
       return cell
        
    }
 // When the row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        do
        {
            //Path for folder
            let audioPath = Bundle.main.path(forResource: sounds[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            audioStuffed = true
        }
        catch
        {
            print ("ERROR")
        }
    }
    
     //FUNCTION THAT GETS THE NAME OF THE SONGS FROM THE FOLDER
       func gettingSongNames()
       {
        // URL TO FOLDER
           let folderURL = URL(fileURLWithPath:Bundle.main.resourcePath!)
        
        // Loop through the folder
           do
           {
            // files stored in SongPath (array of our songs)
               let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
               
               //loop through the files
               for song in songPath
               {
                
                   var mySong = song.absoluteString
                   
                   if mySong.contains(".mp3")
                   {
                    // to find the mp3 name
                       let findString = mySong.components(separatedBy: "/")
                       mySong = findString[findString.count-1]
                       mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                       mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                       sounds.append(mySong)
                   }
                   
               }
               
              tableView.reloadData()
           }
           catch
           {
               print ("ERROR")
           }
       }
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
