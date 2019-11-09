//
//  GigDetailViewController.swift
//  Gigs
//
//  Created by Blake Andrew Price on 11/7/19.
//  Copyright © 2019 Blake Andrew Price. All rights reserved.
//

import UIKit

class GigDetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    //MARK: - Properties
    var gigController: GigController!
    var gig: Gig?
    
    let dateFormatter: DateFormatter =  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm/dd/yy"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        let title = jobTitleTextField.text!
        let dueDate = datePicker.date
        let description = descriptionTextView.text ?? ""
        let gig = Gig(title: title, description: description, dueDate: dueDate)
        gigController.createGig(with: gig) { (error) in
            if let error = error {
                print("Error creating gig: \(error)")
            } else {
                DispatchQueue.main.async {
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    //MARK: - Functions
    func updateViews() {
        if let gig = gig {
            jobTitleTextField.text = gig.title
            descriptionTextView.text = gig.description
            datePicker.date = gig.dueDate
        } else {
            navigationItem.title = "New Gig"
        }
    }
}
