//
//  ViewController.swift
//  pcmedic-demo
//
//  Created by Christian Alexander Morante Santander on 2/07/22.
//
import FirebaseFirestore
import UIKit

class ViewController: UIViewController {
    
    let database = Firestore.firestore()

    var semana = [
        "Lunes",
        "Martes",
        "Miércoles",
        "Jueves",
        "Viernes",
        "Sábado",
    ]
    
    var trabajadores = [
        "Juan M.",
        "Carlos M.",
        "Pedro M.",
    ]
    
    var horarios = [
        "10:00",
        "12:00",
        "14:00",
        "16:00",
        "18:00",
        "20:00",
    ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
//       registrar
        let docRef = database.document("Reuniones/reunion_hora")
        docRef.setData(["nombre":"Christian","apellido":"Morante"], merge: true)
        docRef.addSnapshotListener { snap, error in

                    guard let data = snap?.data(), error == nil else {

                        return
                    }
                }
    }



}
