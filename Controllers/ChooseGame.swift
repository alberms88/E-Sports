//
//  ChooseGame.swift
//  E-sports
//
//  Created by user177938 on 2/24/21.
//

import UIKit

class ChooseGame: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ChooseGame_ChooseLeague(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "ChooseL") as! ChooseLeague
        

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
    }
    

}
