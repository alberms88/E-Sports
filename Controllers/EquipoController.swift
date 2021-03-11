//
//  EquipoController.swift
//  E-sports
//
//  Created by Apps2m on 04/03/2021.
//

import UIKit

class EquipoController: UIViewController {

    @IBOutlet weak var Container: UIView!
    var Noticias : UIViewController?
    var Partidos : UIViewController?
    
    @IBOutlet weak var LogoEquipo: UIImageView!
    
    
    private var activeViewController : UIViewController?{

        didSet {

            RemoveInactiveViewController(inactiveViewController: oldValue)

            updateActiveViewController()

        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfigureApp()
    }
    
    func ConfigureApp() {

        //1. Referenciamos nuestro storyboard

          let storyboard = UIStoryboard(name: "Main", bundle: nil)

        

          //2. Inicializamos youngViewController

          Noticias = storyboard.instantiateViewController(withIdentifier: "ContainerNoticias")

        

          //3. Inicializamos oldViewController

          Partidos = storyboard.instantiateViewController(withIdentifier: "ContainerPartidos")

    }
    
    @IBAction func Noticias_Partidos(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            activeViewController = Noticias
        }
        else if sender.selectedSegmentIndex == 1{
            activeViewController = Partidos
        }
    }
    
    private func RemoveInactiveViewController(inactiveViewController: UIViewController?) {

        

        if let inactiveVC = inactiveViewController {

             //1. Avisamos al child view controller que vamos a eliminarlo de su content

            inactiveVC.willMove(toParent: nil)

        

             //2. Eliminamos la view del child view controller de la jerarquía de vistas del content

             inactiveVC.view.removeFromSuperview()

        

             //3. Finalizamos la relación entre el content y el child view controller

            inactiveVC.removeFromParent()

          }

    }
    
    private func updateActiveViewController() {

        if let activeVC = activeViewController {

        

             //1. Comenzamos la relación entre el content y el child view controller

            addChild(activeVC)

             

             //2. Establecemos el tamaño y posición del child view controller

             activeVC.view.frame = Container.bounds

        

             //3. Añadimos la view del child view controller a la jerarquía de vistas del content

             Container.addSubview(activeVC.view)

        

             //4. Avisamos al child view controller que hemos realizado el cambio

            activeVC.didMove(toParent: self)

          }

    }

    override func didReceiveMemoryWarning() {

            super.didReceiveMemoryWarning()

        }

}

