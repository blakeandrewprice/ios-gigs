//
//  GigsTableViewController.swift
//  Gigs
//
//  Created by Blake Andrew Price on 11/7/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class GigsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if gigController.bearer == nil {
            performSegue(withIdentifier: "LoginViewSegue", sender: self)
        }
    }
    
    var gigController = GigController()
    
    let dateFormatter = DateFormatter()
    
    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gigController.gigs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dateFormatter.dateFormat = "mm/dd/yy"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigCell", for: indexPath)
        let date = gigController.gigs[indexPath.row].dueDate
        cell.textLabel?.text = gigController.gigs[indexPath.row].title
        cell.detailTextLabel?.text = dateFormatter.string(from: date)
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "LoginViewSegue" {
//            if let loginVC = segue.destination as? LoginViewController {
//                loginVC.gigController = gigController
//            }
//        } else if segue.identifier == "ShowDetailSegue" {
//            if let detailVC = segue.destination as? GigDetailViewController {
//                if let indexPath = tableView.indexPathForSelectedRow {
//                    detailVC. = gigController.gigs[indexPath.row].title
//                }
//                detailVC.gigController = gigController
//            }
//        }
//    }
}
