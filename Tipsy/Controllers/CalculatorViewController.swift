//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipsyBrain = TipsyBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var result: String?
    var numberOfPeople: Int?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billWithoutTip = Float(billTextField.text!) ?? 123.56
        let numberOfPeople = Int(splitNumberLabel.text!)!
        let tipPercentage: Float
        
        // getting the tip selected
        if zeroPctButton.isSelected {
            tipPercentage = Float(zeroPctButton.currentTitle!.dropLast())!
        } else if tenPctButton.isSelected {
            tipPercentage = Float(tenPctButton.currentTitle!.dropLast())!
        } else {
            tipPercentage = Float(twentyPctButton.currentTitle!.dropLast())!
        }
        
        tipsyBrain.calculateAmountPerPerson(billWithoutTip, numberOfPeople, tipPercentage)
        
        performSegue(withIdentifier: "ResultScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultScreen" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = tipsyBrain.getNumberOfPeople()
            destinationVC.tip = tipsyBrain.getTip()
            destinationVC.tipPercentage = tipsyBrain.getTipPercentage()
            destinationVC.totalAmount = tipsyBrain.getTotalAmount()
            destinationVC.amountPerPerson = tipsyBrain.getAmountPerPerson()
        }
    }
    
    
}

