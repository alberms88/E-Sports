//
//  ChooseLeague.swift
//  E-sports
//
//  Created by user177938 on 2/26/21.
//

import UIKit

class ChooseLeague: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func League_Team(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "ChooseT") as! ChooseTeam
        

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
    }
    


}
