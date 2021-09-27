//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Victor Colen on 26/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var numberOfPeople: Int?
    var tip: Float?
    var tipPercentage: Float?
    var totalAmount: Float?
    var amountPerPerson: Float?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", amountPerPerson!)
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage! * 100)% tip."
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
