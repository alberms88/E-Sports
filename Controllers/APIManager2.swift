
import Foundation
import Alamofire

public var token = "TOKEN_KEY"

enum MyResult<T,E:Error> {
    case succes(T)
    case failure(E)
}

enum APIError:Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    case succes
}


class APIManager {
    
    //URL de nuestra API
    
    let resourceURL: URL
    
    init(endpoint: String) {
        
        let resourceString = "http://ec2-54-234-135-238.compute-1.amazonaws.com/api-esports/public/index.php/api/\(endpoint)"
        
        guard let resourceURL = URL(string: resourceString)else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    //Funcion register que pasaremos un usuario y un error dependiendo de cual sea el caso

    func register(_ userToSave: User, completion: @escaping(Swift.Result<User,Error>)->Void){
        
        //realizamos la peticion a la api con la URL, el usuario introducido, el formato del usuario(JSON).
        Alamofire.request(resourceURL, method: .post, parameters: userToSave.getDictRegister(), encoding: JSONEncoding.default, headers: nil).responseData{ response in
            switch response.result{
                
                //En caso de que la respuesta sea posible
                case .success(_):
                    
                    if response.response?.statusCode == 200 {
                        
                        print("El usuario " + userToSave.nombre + " ha sido creado")

                        completion(.success(userToSave))
                    }else{
                        print("No se ha podido crear el usuario")

                    }
                    
                //En caso de no poder hacer la petición dar el siguiente error
                case .failure(_):
                    //print(err.localizedDescription)
                    completion(.failure(APIError.responseProblem))
                }
            }
        
        
    }
    func newLogin(parameters:[String:String])->DataRequest{
        
            return Alamofire.request(resourceURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
    }
    
    //La misma funcion de register pero con un endpoint diferente
    func login(_ userToSave: User, completion: @escaping(Swift.Result<User,Error>)->Void){
        
        Alamofire.request(resourceURL, method: .post, parameters: userToSave.getDictLogin(), encoding: JSONEncoding.default, headers: nil).responseData{ response in
            switch response.result{
                    
                case .success(let data):
                    do{
                        //recibir json de la api
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        
                        if response.response?.statusCode == 200 {
                            
                            print(json)
                            if let json = json as? [String: String] {
                               // now you have a top-level json dictionary
                                //print(json["token"]!)
                                
                                //obtener en el json el valor "token" para guardarlo en el userDefaults
                                let tokenJSON = json["token"]
                                
                                UserDefaults.standard.set(tokenJSON, forKey: token)
                                UserDefaults.standard.synchronize()
                                
                            }
                            
                            completion(.success(userToSave))
                        }else{
                            print(json)
                            completion(.failure(APIError.responseProblem))
                        }
                    }catch{
                        
                        //si los datos introducidos en la app no coinciden con la base de datos

                        print(response.response!.statusCode)
                        
                        print("Usuario o contraseña incorrectas")
                        
                        completion(.failure(APIError.decodingProblem))
                    }
                
                //error de respuesta
                case .failure(_):

                    completion(.failure(APIError.responseProblem))
                }
            }
        }
    
    
    func changePass(_ userToSave: User, completion: @escaping(Swift.Result<User,Error>)->Void){
        
        Alamofire.request(resourceURL, method: .post, parameters: userToSave.getDictChangePass(), encoding: JSONEncoding.default, headers: userToSave.getDictToken()).responseData{ response in
            switch response.result{
                    
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        
                        if response.response?.statusCode == 200 {
                            
                            print(json)
                            completion(.success(userToSave))
                            
                        }else{
                            print(json)
                            completion(.failure(APIError.responseProblem))
                        }
                    }catch{
                        print(response.response!.statusCode)
                        
                        print(userToSave.getDictToken())
                        
                        print("Usuario o contraseña incorrectas")
                        
                        completion(.failure(APIError.decodingProblem))
                    }
                    
                case .failure(_):
                    //print(err.localizedDescription)
                    completion(.failure(APIError.responseProblem))
                }
            }
        }
        
    
    func getUser(_ completion: @escaping(Result<Error>?, [String]?)-> Void){
        
        //realizamos la peticion a la api con la URL, el formato del usuario(JSON).
        
        Alamofire.request(resourceURL, method: .get, encoding: JSONEncoding.default, headers: nil).responseData{ response in
            switch response.result{
                
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data) as? [String]
                        
                        if response.response?.statusCode == 200 {
                            completion(.success(APIError.succes), json)
                            
                            
                        }else{

                            completion(.failure(APIError.responseProblem), nil)
                        }
                    }catch{
                        print(response.response!.statusCode)
                        
                        completion(.failure(APIError.decodingProblem), nil)
                    }
                    
                case .failure(_):
                    //print(err.localizedDescription)
                    completion(.failure(APIError.responseProblem), nil)

                }
                
                
            }
        }
    

}

