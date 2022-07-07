//
//  ViewController.swift
//  pcmedic-demo
//
//  Created by Christian Alexander Morante Santander on 2/07/22.
//
import FirebaseFirestore
import UIKit

class ViewController: UIViewController {
    
    //objetos
    @IBOutlet weak var diasPickerView: UIPickerView!
    @IBOutlet weak var horaPickerView: UIPickerView!
    @IBOutlet weak var trabajadoresSegmentedControl: UISegmentedControl!
    @IBOutlet weak var guardarButton: UIButton!
    @IBOutlet weak var miListaButton: NSLayoutConstraint!
    @IBOutlet weak var primerView: UIView!
    @IBOutlet weak var segundoView: UIView!
    @IBOutlet weak var tercerView: UIView!
    
    @IBOutlet weak var fechaPickerView: UIDatePicker!
    
    //actions
    
    
    
    @IBAction func guardarAction(_ sender: Any) {
        
        let i = trabajadoresSegmentedControl.selectedSegmentIndex
        print (trabajadoresSegmentedControl.titleForSegment(at: i))
        diasPickerView.selectRow(1, inComponent: 1, animated: true)
        
        fechaPickerView.timeZone
    }
    
    
    //variables
    let database = Firestore.firestore()
    var pickerhora:String!
    var pickerdia:String!
    private let semana = [
        "Lunes",
        "Martes",
        "Miércoles",
        "Jueves",
        "Viernes",
        "Sábado"
    ]
    
    private let trabajadores = [
        "Juan M.",
        "Carlos M.",
        "Pedro M."
    ]
    
    private let horarios = [
        "10:00",
        "12:00",
        "14:00",
        "16:00",
        "18:00",
        "20:00"
    ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //estilos de las views
        primerView.layer.cornerRadius = 20
        segundoView.layer.cornerRadius = 20
        tercerView.layer.cornerRadius = 20
        
        //Llenar el PickerView Días
        
        diasPickerView.dataSource = self
        diasPickerView.delegate = self
        //Llenar el PickerView Horas
        
        horaPickerView.dataSource = self
        horaPickerView.delegate = self
        //Llenar el SegementedControl trabajadores
        trabajadoresSegmentedControl.removeAllSegments()
        for (index, value) in
                trabajadores.enumerated()       {
            
            trabajadoresSegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        
        
 
        
        
        
        
        
/*      registrar
        let docRef = database.document("Reuniones/reunion_hora")
        docRef.setData(["nombre":"Christian","apellido":"Morante"], merge: true)
        docRef.addSnapshotListener { snap, error in

                    guard let data = snap?.data(), error == nil else {

                        return
                    }
                }
        
*/
        
    }



}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    

func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

   
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
    if pickerView == diasPickerView {
        return semana.count
    }
    else {
        return horarios.count
    }
  
}

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == diasPickerView {
            return semana[row]
        }
        else {
            return horarios[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == diasPickerView {
            
        }
        else {
            
        }
        
    }
}

