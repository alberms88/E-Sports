

import UIKit
import Alamofire

class Registro: UIViewController {
    
    @IBOutlet weak var NombreTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RepeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func PostRegistrar(_ sender: Any) {
        if PasswordTextField.text! != RepeatPasswordTextField.text! {
            print("contraseñas incorrectas")
            return
        }else{
            
            let userText = NombreTextField.text!
            let emailText = EmailTextField.text!
            let passText = PasswordTextField.text!
            
            //let user = User(email: emailText, name: userText, password: passText)
            
            let user = User(nombre: userText, email: emailText, password: passText)
            
            //let postRequest = APIManager(endpoint: "api/register")
            let postRequest = APIManager(endpoint: "users/registro")
            
            //let postRequest = APIRequest(endpoint: "users/create")
            
            postRequest.register(user, completion: {result in
                switch result{
                case .success(let user):
                    print("El siguiente usuario ha sido enviado:\(user.email) ")
                case .failure(let error):
                    print("Ha ocurrido un error \(error)")
                    //print(JSONDecoder.decode(User.self))
                    //print(user.email)
                }
            })
        }
    }
}



