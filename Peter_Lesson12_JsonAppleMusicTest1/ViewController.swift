//
//  ViewController.swift
//  Peter_Lesson12_JsonAppleMusicTest1
//
//  Created by Kwan Ho Leung on 20/4/2022.
//

import UIKit

class ViewController: UIViewController {

    var items = [musicApiItems]()
    
    @IBOutlet weak var textField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.layer.borderColor = UIColor.tintColor.cgColor
        textField1.layer.borderWidth = 2
        textField1.layer.cornerRadius = 4
    }
    
    @IBAction func nextPage(_ sender: Any) {
        performSegue(withIdentifier: "toMusicList", sender: nil)
    }
    
    @IBSegueAction func sendSearching(_ coder: NSCoder) -> MusicListTableViewController? {
        let controller = MusicListTableViewController(coder: coder)
        if let keyword = textField1.text{
            controller?.keyword = keyword
        }
        return controller
    }
    
    
    
}

