//
//  MainViewController.swift
//  PasswordBackUp
//
//  Created by Laure Compoint on 07/05/2020.
//  Copyright © 2020 Laure Compoint. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
         
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PasswordCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
       
        
        //cell.setUp(with: movie)
        
        return cell
    }
}
