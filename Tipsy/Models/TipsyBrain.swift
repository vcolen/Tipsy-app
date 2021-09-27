//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Victor Colen on 27/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct TipsyBrain {
    var tipsy: Tipsy?
    
    mutating func calculateAmountPerPerson(_ billWithoutTip: Float, _  numberOfPeople: Int, _ tipPercentage: Float ) {
        let totalAmount = billWithoutTip + (billWithoutTip * (tipPercentage/100))
        let amountPerPerson = totalAmount/Float(numberOfPeople)
        let tip = totalAmount - billWithoutTip
        
        tipsy = Tipsy(numberOfPeople: numberOfPeople, tip: tip, tipPercentage: tipPercentage/100, totalAmount: totalAmount, amountPerPerson: amountPerPerson)
    }
    
    func getTip() -> Float {
        tipsy?.tip ?? 0.0
    }
    
    func getNumberOfPeople() -> Int {
        tipsy?.numberOfPeople ?? 2
    }
    
    func getTipPercentage() -> Float {
        tipsy?.tipPercentage ?? 0.0
    }
    
    func getAmountPerPerson() -> Float {
        tipsy?.amountPerPerson ?? 0.0
    }
    
    func getTotalAmount() -> Float {
        tipsy?.totalAmount ?? 0.0
    }
}
