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
//        fetchData()
    }

    func fetchData(){
//        let urlString = "https://itunes.apple.com/search?term=Kazuyoshisaito&media=music&country=tw"
        let urlString = "https://itunes.apple.com/search?term=\(keyword)&media=music&country=tw"
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data{
                    let decoder = JSONDecoder()
                    do{
                        let musicApiResponse = try decoder.decode(musicApiResponse.self, from: data)
                        self.items = musicApiResponse.results
                        print(self.items)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    print("fetch item error")
                }
            }.resume()
        }
    }
    
    // MARK: - Table view data source

//    REMEMBER TO HIDE THIS
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
