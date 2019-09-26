//
//  SettingsViewController.swift
//  Tip Jar
//
//  Created by t on 9/24/19.
//  Copyright © 2019 TanyaAzari. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var mediumYellow: UIView!
    @IBOutlet weak var largeYellow: UIView!
    @IBOutlet weak var tipControl2: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newDefault(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard
        
        switch tipControl2.selectedSegmentIndex {
        case 0:
            defaults.set(0.15, forKey: "defaultTip")
        case 1:
            defaults.set(0.18, forKey: "defaultTip")
        case 2:
            defaults.set(0.20, forKey: "defaultTip")
        default:
            defaults.set(0.15, forKey: "defaultTip")
        }
        
        defaults.synchronize()
    }
    
    @IBAction func visibleViews(_ sender: UISegmentedControl) {
        let defaults = UserDefaults.standard
        
        switch tipControl2.selectedSegmentIndex {
        case 0:
            defaults.set(true, forKey: "mY")
            defaults.set(true, forKey: "lY")
        case 1:
            defaults.set(false, forKey: "mY")
            defaults.set(true, forKey: "lY")
        case 2:
            defaults.set(false, forKey: "mY")
            defaults.set(false, forKey: "lY")
        default:
            defaults.set(true, forKey: "mY")
            defaults.set(true, forKey: "lY")
        }
        
        mediumYellow.isHidden = defaults.bool(forKey: "mY")
        largeYellow.isHidden = defaults.bool(forKey: "lY")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTipValue = defaults.double(forKey: "defaultTip")
        
        switch defaultTipValue {
        case 0.15:
            tipControl2.selectedSegmentIndex = 0
        case 0.18:
            tipControl2.selectedSegmentIndex = 1
        case 0.20:
            tipControl2.selectedSegmentIndex = 2
        default:
            tipControl2.selectedSegmentIndex = 0
        }
        
        mediumYellow.isHidden = defaults.bool(forKey: "mY")
        largeYellow.isHidden = defaults.bool(forKey: "lY")
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
