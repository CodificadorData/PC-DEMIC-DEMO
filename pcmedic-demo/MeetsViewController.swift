//
//  MeetsViewController.swift
//  pcmedic-demo
//
//  Created by Christian Alexander Morante Santander on 4/07/22.
//
import Foundation
import UIKit
import FirebaseFirestore
import FirebaseFunctions

class MeetsViewController: UIViewController {

    let conexion = Firestore.firestore()
    
    var reuniones : [Reunion] = []
    
    @IBOutlet weak var reunionesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reunionesTableView.dataSource = self
        reunionesTableView.delegate = self
        FirebaseDatabase.shared.getList(document: "Reuniones") { (reuniones: [Reunion]) in
            self.reuniones = reuniones
            self.reunionesTableView.reloadData()
        }
       
                
//        conexion.collection("Reuniones").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//
//                for document in querySnapshot!.documents {
//
//                    let data = document.data()
//                    let id = data["id"] as? String
//                    let reunion = Reunion(dia: <#T##String#>, hora: <#T##String#>, id: id, trabajador: <#T##String#>)
//                    reuniones.append(reunion)
//                    print("\(document.documentID) => \(document.data())")
//
//                }
//            }
//        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MeetsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reuniones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ReunionTableCell
        else {
            return UITableViewCell()
        }
        
        let reunion = reuniones[indexPath.row]
        cell.trabajadorLabel.text = reunion.trabajador
        cell.diaLabel.text = reunion.dia
        cell.horaLabel.text = reunion.hora
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
