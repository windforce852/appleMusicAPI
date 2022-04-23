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
        fetchData()
//        performSegue(withIdentifier: "toMusicList", sender: nil)
    }
    
    @IBSegueAction func sendSearching(_ coder: NSCoder) -> MusicListTableViewController? {
        let controller = MusicListTableViewController(coder: coder)
//        if let keyword = textField1.text{
//            controller?.keyword = keyword
//        }
        controller?.items = items
        return controller
    }
    
    func fetchData(){
        if let keyword = textField1.text{
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
                                self.performSegue(withIdentifier: "toMusicList", sender: nil)
                            }
                        } catch {
                            print(error)
                            DispatchQueue.main.async {
                                self.noResult()
                            }
                        }
                    } else {
                        print("fetch item error")
                    }
                }.resume()
            }
        }
    }

    func noResult(){
        let controller = UIAlertController(title: "No Results", message: "Try another song or singer", preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            //
        }))
        present(controller, animated: true, completion: nil)
    }
    
}

