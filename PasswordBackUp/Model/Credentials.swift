//
//  Credentials.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 28/05/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import Foundation
import Firebase

struct Credentials{
    var reference: DocumentReference
    var documentID: String
    var title: String
    var password: String
    var url: String
    
    init(document: DocumentSnapshot){
        reference = document.reference
        documentID = document.documentID
        let data = document.data() ?? [:]
        title = data["title"] as? String ?? ""
        password = data["password"] as? String ?? ""
        url = data["url"] as? String ?? ""
    }
}
