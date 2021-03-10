//
//  NoticiasViewController.swift
//  E-sports
//
//  Created by user177944 on 06/03/2021.
//

import UIKit

class NoticiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tabView: UITableView!
    
    var noticias = [DatosNoticia]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
            self.tabView.reloadData()
        }
        tabView.delegate = self
        tabView.dataSource = self
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticias.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = noticias[indexPath.row].localized_name.capitalized
        return cell
    }
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.opendota.com/api/heroStats" )
        URLSession.shared.dataTask(with: url!){ (data, response, error)in
            
            if error == nil {
                do{
                self.noticias = try JSONDecoder().decode([DatosNoticia].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("JSON Error")
                }
            }
        }.resume()
    }
}
