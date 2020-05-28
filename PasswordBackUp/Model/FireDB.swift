//
//  FireDB.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 14/05/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import Foundation
import Firebase

class FireDB {
    var data = [String: Any]()
    let store = Firestore.firestore()
    var users: CollectionReference {
        return store.collection("users")
    }
    var credit: CollectionReference {
        return store.collection("credentials")
    }
    func addUser(_ uid: String, data: [String: Any]){
        users.document(uid).setData(data)
    }
    func addCredentials( data: [String : Any], completion: @escaping (_ error: String?) -> Void){
        
        guard let uid = FireAuth().currentId else {
            completion("Error: vous n'etez pas authentifié")
            return
        }
        users.document(uid).collection("credentialscollection").document().setData(data) { (error) in
            if let error = error {
                completion(error.localizedDescription)
                return
            }
            completion(nil)
        }
        
        
    }
    
}
