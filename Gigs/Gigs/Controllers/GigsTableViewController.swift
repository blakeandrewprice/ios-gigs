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
        
        // transition to login view if conditions require
        if apiController.bearer == nil {
            performSegue(withIdentifier: "LoginViewSegue", sender: self)
        }
    }
    
    var gigController: GigController()

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
