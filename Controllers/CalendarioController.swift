//
//  CalendarioController.swift
//  E-sports
//
//  Created by Apps2m on 10/03/2021.
//

import UIKit

class CalendarioController: UIViewController {

    @IBOutlet weak var ContainerCalendario: UIView!
    
    var Liga1 : UIViewController?
    var Liga2 : UIViewController?
        
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

              Liga1 = storyboard.instantiateViewController(withIdentifier: "ContainerLEC")

            

              //3. Inicializamos oldViewController

              Liga2 = storyboard.instantiateViewController(withIdentifier: "ContainerLCS")

        }
        
        
    @IBAction func Liga1_Liga2(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
                activeViewController = Liga1
            }
            else if sender.selectedSegmentIndex == 1{
                activeViewController = Liga2
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

                 activeVC.view.frame = ContainerCalendario.bounds

            

                 //3. Añadimos la view del child view controller a la jerarquía de vistas del content

                 ContainerCalendario.addSubview(activeVC.view)

            

                 //4. Avisamos al child view controller que hemos realizado el cambio

                activeVC.didMove(toParent: self)

              }

        }

        override func didReceiveMemoryWarning() {

                super.didReceiveMemoryWarning()

            }

    }
