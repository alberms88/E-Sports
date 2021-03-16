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
        
        let userText = NombreTextField.text!
        let emailText = EmailTextField.text!
        let passText = PasswordTextField.text!
        let confirmText = RepeatPasswordTextField.text!
        
        if userText == ""{
            print("Usuario vacio")
            
            let alert = UIAlertController(title: "Error", message: "Nombre de Usuario invalido", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
            
            return
        }else if emailText == ""{
            print("Email vacio")
            
            let alert = UIAlertController(title: "Error", message: "Email invalido", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
            
            return
            
        }else if passText == ""{
            print("Contraseña vacia")
            
            let alert = UIAlertController(title: "Error", message: "Contraseña invalida", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
            
            return
            
        }else if passText != confirmText{
            print("Las contraseñas no coinciden")
            
            let alert = UIAlertController(title: "Error", message: "Las contraseñas no coinciden", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

            self.present(alert, animated: true, completion: nil)
            
            return
            
        }else{
            let user = User(nombre: userText, email: emailText, password: passText)
            
            let postRequest = APIManager(endpoint: "users/registro")
            
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
