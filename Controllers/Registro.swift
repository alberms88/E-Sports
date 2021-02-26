

import UIKit

class Registro: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func Register_Login(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "Logeando") as! Login
        

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
       
    }
    
    @IBAction func Back_Login(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "Logeando") as! Login
        

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
    }
}
