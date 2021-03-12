
import Foundation

//struct User: Decodable {
//    let email: String
//    let password: String
//}

struct User: Encodable{
    var id: Int?
    let nombre: String
    let email: String
    let password: String
    
    init(nombre: String, email: String, password: String) {
        self.nombre = nombre
        self.email = email
        self.password = password
    }
    
    func getDictRegister() -> [String:String] {
        return ["nombre":nombre, "email":email, "password": password]
    }
    
    func getDictRegisterApi() -> [String:String] {
        return ["user":nombre, "email":email, "password": password]
    }
    
    func getDictLogin() -> [String:String] {
        return ["nombre":nombre, "password": password]
    }
    
    func getDictChangePass() -> [String:String] {
        return ["email":email, "password": password]
    }
    
    func getDictToken()->[String:String]{
        
        if let token = UserDefaults.standard.string(forKey: token){
            return["Authorization":token]
        }else{
            return["Authorization":"No hay token"]
        }
    }
    
    
}



//class User: Codable{
//    public var id: Int?
//    let user: String
//    let pass: String
//
//    init(user: String, pass: String) {
//            self.user = user
//            self.pass = pass
//        }
//}
