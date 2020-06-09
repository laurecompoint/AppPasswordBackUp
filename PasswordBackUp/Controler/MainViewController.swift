//
//  MainViewController.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 07/05/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class MainViewController: UIViewController {
    var db: Firestore!
    var credentialsCollection: [Credentials] = []
    var selectedPassword: Credentials!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FireDB().getCredentialsCollection { (credentialsCollection, error) in
            if let error = error {
                self.presentAlert(title: "error", message: error)
                return
            }
            guard let credentialsCollection = credentialsCollection else {
                self.presentAlert(title: "error", message: "Erreur indéterminée")
                return
            }
            self.credentialsCollection = credentialsCollection
            self.tableView.reloadData()
        }
        tableView.delegate = self
        
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard segue.identifier == "todetail", let selectedPassword = self.selectedPassword else { return }
        let detailVC = segue.destination as! DetailViewController
       detailVC.credentialsCollection = selectedPassword

        
        
    }
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
        return credentialsCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CredentialsCell", for: indexPath)
       
        cell.textLabel?.text = credentialsCollection[indexPath.row].title
 return cell
    }
}
extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SELECT")
        
        self.selectedPassword = credentialsCollection[indexPath.row]
        performSegue(withIdentifier: "todetail", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        print("DELETE")
        credentialsCollection.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
       
        
    }
   
    
}
