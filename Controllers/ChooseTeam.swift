//
//  ChooseTeam.swift
//  E-sports
//
//  Created by Apps2m on 02/03/2021.
//

import UIKit

class ChooseTeam: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func ChooseTeam_ChooseLeague(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "ChooseL") as! ChooseLeague
        

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
    }
    

}
