//
//  ViewController.swift
//  Prework
//
//  Created by Jesus Robles on 2/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonTotalAmount: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var partySizeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Have keyboard show up as soon as app starts
        billAmountTextField.becomeFirstResponder()
        
        self.title = "Tip Calculator"
    }

    @IBAction func calculateTip(_ sender: Any) {
        // bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Party size from Stepper
        let numPartySize = Double(partySizeStepper.value)
        
        // Total tip calculated by multiplying tip * tip Percentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update Total Amount Per Person
        perPersonTotalAmount.text = String(format: "$%.2f", (total/numPartySize))
        
        // Update Party Size Label
        partySizeLabel.text = String(format:"%.0f", partySizeStepper.value)
        
    }
    
}

