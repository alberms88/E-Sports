
import Foundation
import UIKit

public var DatosUsuario = "USER_KEY"

class Login2: UIViewController {

    @IBOutlet weak var NombreTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    
    @IBAction func loginTouch(_ sender: Any) {

        let password = PasswordTextField.text!
        let nombre = NombreTextField.text!

        let user = User(nombre: nombre, email: "", password: password)
        
        //let postRequest = APIRequest(endpoint: "users/login")
        let postRequest = APIManager(endpoint: "users/login")

        postRequest.login(user, completion: {result in
            switch result{
            case .success(let user):
                print("El siguiente usuario ha sido enviado:\(user.nombre) ")
                UserDefaults.standard.set(user.nombre, forKey: datosUsuario)
                UserDefaults.standard.synchronize()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let vc = storyboard.instantiateViewController(identifier: "ChooseGame") as! ChooseGame
                        
                vc.modalPresentationStyle = .overFullScreen
                
                self.present(vc, animated: true)
                
            case .failure(let error):
                print("Ha ocurrido un error \(error)")
                
                let alert = UIAlertController(title: "Error", message: "Datos incorrectos", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

                self.present(alert, animated: true, completion: nil)
                return
            }
        })

    }
        


}

