
import UIKit

class Login: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
   
    @IBAction func Login_Register(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "Register") as! Registro

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
       
    }
    
    @IBAction func Login_ChooseGame(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

        let vc = storyboard.instantiateViewController(identifier: "ChooseG") as! ChooseGame

                

        vc.modalPresentationStyle = .overFullScreen

        

        present(vc, animated: true)
    }
}
