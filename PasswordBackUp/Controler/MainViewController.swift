//
//  MainViewController.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 07/05/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var credentialCollection: [Credentials] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        FireDB().getCredentialsCollection { (credentialCollection, error) in
            if let error = error {
                
              self.presentAlert(title: "error", message: error)
              return
            }
            guard let credentialCollection = credentialCollection else{
                self.presentAlert(title: "error", message: "error indeterminer")
                return
            }
            self.credentialCollection = credentialCollection
            //recharger les donnee table view
            self.TableView.reloadData()
        }
    }
    
    @IBOutlet weak var TableView: UITableView!
    @IBAction func logoutBtnDidPressed(_ sender: Any) {
        if let error = FireAuth().signOut() {
            let alertVC = UIAlertController(title: "Erreur !", message: error, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
            present(alertVC, animated: true, completion: nil)
            return
        }
        navigationController?.popViewController(animated: true)
    }
    

}
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return credentialCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CredentialsCell", for: indexPath)
       
        cell.textLabel?.text = credentialCollection[indexPath.row].title

        return cell
    }
}
