

import UIKit
import Alamofire

class Registro: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func PostRegistrar(_ sender: Any) {
        if (repeatPassword == password){
            let url = URL(string:
            "http://ec2-54-91-55-219.compute-1.amazonaws.com/api-esports/public/index.php/api/users/registro")

            let json = ["nombre" : nombre.text!, "email" : email.text!, "password" : password.text! ]

            Alamofire.request(url!, method: .post, parameters: json as Parameters,
            encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in

                print(response)}

        } else {
            
            print("Contraseñas no coinciden")
        }
    }
    
}
