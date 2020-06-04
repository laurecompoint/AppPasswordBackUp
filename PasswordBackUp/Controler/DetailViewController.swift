//
//  DetailViewController.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 04/06/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var credentialCollection: Credentials!
     @IBOutlet weak var titlepassword: UILabel!
     @IBOutlet weak var emailpassword: UILabel!
     @IBOutlet weak var nicknamepassword: UILabel!
     @IBOutlet weak var passwordpassword: UILabel!
     @IBOutlet weak var urlpassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titlepassword.text = credentialCollection.title
        //emailpassword.text = credentialCollection.email
        //nicknamepassword.text = credentialCollection.nickname
        passwordpassword.text = credentialCollection.password
        urlpassword.text = credentialCollection.url
        // Do any additional setup after loading the view.
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
