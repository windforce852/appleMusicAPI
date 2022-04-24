//
//  MusicDetailViewController.swift
//  Peter_Lesson12_JsonAppleMusicTest1
//
//  Created by Kwan Ho Leung on 23/4/2022.
//

import UIKit

class MusicDetailViewController: UIViewController {

    var item: musicApiItems
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
//    ///Lesson8 00:29, coder is for storyboard ;
    init?(coder: NSCoder, item: musicApiItems){
        self.item = item
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView1.kf.setImage(with: item.artworkUrl100)
        label1.text = item.trackName
        label2.text = item.artistName
        label3.text = "Album: \(item.collectionName)"
        label4.text = "Price \(String(item.collectionPrice))"
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
