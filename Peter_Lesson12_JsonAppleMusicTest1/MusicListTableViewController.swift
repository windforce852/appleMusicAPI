//
//  MusicListTableViewController.swift
//  Peter_Lesson12_JsonAppleMusicTest1
//
//  Created by Kwan Ho Leung on 21/4/2022.
//

import UIKit
import Kingfisher

class MusicListTableViewController: UITableViewController {

    var items = [musicApiItems]()
    var keyword = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBSegueAction func goToDetailPage(_ coder: NSCoder) -> MusicDetailViewController? {
        if let row = tableView.indexPathForSelectedRow?.row {
            return MusicDetailViewController(coder: coder, item: items[row])
        } else {
            return nil
        }
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicTableViewCell", for: indexPath) as! MusicTableViewCell

        // Configure the cell...
        let item = items[indexPath.row]
        cell.songNameLabel.text = item.trackName
        cell.albumNameLabel.text = item.collectionName
        cell.singerNameLabel.text = item.artistName
        cell.musicImageView.kf.setImage(with: item.artworkUrl100)
        return cell
    }
    
    //    REMEMBER TO HIDE THIS
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return 0
    //    }

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
