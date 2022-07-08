//
//  FirebaseDatabase.swift
//  pcmedic-demo
//
//  Created by Christian Alexander Morante Santander on 5/07/22.
//

import Foundation
import FirebaseFirestore

public class FirebaseDatabase {
    
    static let shared = FirebaseDatabase()
    let database = Firestore.firestore()
    
    func setData<T: Codable>(document: String, object: T ){
        let docRef = database.document(document)
        docRef.setData(object.toDictionnary!, merge: true)
    }
    
    func getDataListener<T: Codable>(document: String,  block: @escaping (T) -> Void ) {
        let docRef = database.document(document)
        docRef.addSnapshotListener { snap, error in
            
            guard let data = snap?.data(), error == nil else {
                return
            }
            
            //CONVIRTIENDO A OBJETO SWIFT
            guard let object = T(dictionary: data)  else {
                return
            }
            
            //
            print("DATOS: \(data)")
            block(object)
        }
    }
    
    //CONSEGUIR LA COLECCION
    func getList<T: Codable>(document: String,  block: @escaping ([T]) -> Void ) {
        let docRef = database.collection(document)
        docRef.addSnapshotListener { snap, error in
            
            guard let data = snap?.documents, error == nil else {
                return
            }
            
            let list = self.arrayObject(dataList: data, type: T.self)
            
            print("asdasdads \(list)")
            block(list)
        }
    }
    
    //
    func arrayObject<T:Codable>(dataList: [QueryDocumentSnapshot], type: T.Type) -> [T]{
        var arrayObject: [T] = []
        for data in dataList {
            let dictonary =  data.data()
            if let object = T(dictionary: dictonary) {
                arrayObject.append(object)
            }
        }
        return arrayObject
    }
}
//CONVIERTE DE OBJETO SWIFT A JSON
extension Encodable {
    var toDictionnary: [String : Any]? {
        guard let data =  try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
//CONVIERTE DE JSON A OBJETO SWIFT
extension Decodable {
    /// Initialize from JSON Dictionary. Return nil on failure
    init?(dictionary value: [String:Any]){
        
        guard JSONSerialization.isValidJSONObject(value) else { return nil }
        guard let jsonData = try? JSONSerialization.data(withJSONObject: value, options: []) else { return nil }
        
        guard let newValue = try? JSONDecoder().decode(Self.self, from: jsonData) else { return nil }
        self = newValue
    }
}
