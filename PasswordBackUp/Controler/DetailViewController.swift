//
//  DetailViewController.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 04/06/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var credentialsCollection: Credentials!
    
    @IBOutlet weak var UrlTF: UITextField!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var NicknameTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NicknameTF.text = credentialsCollection.nickname
        passwordTF.text = credentialsCollection.password
       // EmailTF.text = credentialsCollection.email
        titleTF.text = credentialsCollection.title
        UrlTF.text = credentialsCollection.url
        
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction func BtnEyesPassword(_ sender: Any) {
         self.passwordTF.isSecureTextEntry = self.passwordTF.isSecureTextEntry ? false : true
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
