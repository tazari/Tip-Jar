//
//  ViewController.swift
//  Tip Calculator
//
//  Created by t on 9/18/19.
//  Copyright © 2019 TanyaAzari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customTip: UITextField!
    
    @IBOutlet weak var split2: UILabel!
    @IBOutlet weak var split3: UILabel!
    @IBOutlet weak var split4: UILabel!
    @IBOutlet weak var split5: UILabel!
    @IBOutlet weak var split6: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let defaultTipValue = defaults.double(forKey: "defaultTip")
        
        switch defaultTipValue {
        case 0.15:
            tipControl.selectedSegmentIndex = 0
        case 0.18:
            tipControl.selectedSegmentIndex = 1
        case 0.20:
            tipControl.selectedSegmentIndex = 2
        default:
            tipControl.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        billField.resignFirstResponder()
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //get billamount
        let bill = Double(billField.text!) ?? 0
        
        //calculate tip and total
        let x = Double(customTip.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2, x]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        split2.text = String(format: "$%.2f", total/2)
        split3.text = String(format: "$%.2f", total/3)
        split4.text = String(format: "$%.2f", total/4)
        split5.text = String(format: "$%.2f", total/5)
        split6.text = String(format: "$%.2f", total/6)
    }
}

