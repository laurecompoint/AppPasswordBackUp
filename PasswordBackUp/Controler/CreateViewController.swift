//
//  CreateViewController.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 14/05/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CancelBtnDidPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func SaveBtnDidPress(_ sender: Any) {
        guard let url = urlTF.text, url != "" else {
            presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de url !")
            return
        }
        guard let title = titleTF.text, title != "" else {
            presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de title !")
            return
        }
        
        guard let nickname = nickname.text, nickname != "" else {
            presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de nickname !")
            return
        }
        guard let email = emailTF.text, email != "" else {
            presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné d’e-mail !")
            return
        }
        guard let password = passwordTF.text, password != "" else {
            presentAlert(title: "Attention !", message: "Vous n’avez pas renseigné de mot de passe !")
            return
        }
        //verifier que url est valide
        //add credentials
        let data: [String: Any] = [
            "title": title ,
            "email": email,
            "password": password,
            "url": url,
            "nickname": nickname
        ]
        FireDB().addCredentials(data: data) { (error) in
            if let error = error {
                self.presentAlert(title: "error", message: error)
                return
            }
              //navigé vers la page suivante
             self.dismiss(animated: true, completion: nil)
            
        }
      
    }
    @IBAction func ShareDidBtnPresse(_ sender: Any) {
    }
    @IBAction func CopieBtnDidPresse(_ sender: Any) {
        
        UIPasteboard.general.string = passwordTF.text
    }
    
    @IBAction func BtnEyes(_ sender: Any) {
         self.passwordTF.isSecureTextEntry = self.passwordTF.isSecureTextEntry ? false : true
    }
    
//    private func presentAlert(title: String, message: String) {
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
//        present(alertVC, animated: true, completion: nil)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
