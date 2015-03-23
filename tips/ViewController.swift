//
//  ViewController.swift
//  tips
//
//  Created by Bryan McLellan on 3/20/15.
//  Copyright (c) 2015 Bryan McLellan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.18, 0.2, 0.22]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("View DiD Load")
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {

        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
        //get user settings
        var defaults = NSUserDefaults.standardUserDefaults()
        var intVal = defaults.integerForKey("SettingTipPercentage")
        var SettingString = defaults.objectForKey("SettingString") as String
        
        if(SettingString != ""){
            // update to user input
            tipPercentages[0] = Double(intVal)/100
            var formatString = SettingString + "%"
            tipControl.setTitle(formatString, forSegmentAtIndex: 0)
        }
        else{
            // if they dont pick their percentage on first call, just use default value of 18%
            tipPercentages[0] = 0.18
            tipControl.setTitle("18%", forSegmentAtIndex: 0)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("", forKey: "SettingString")

    }
}

