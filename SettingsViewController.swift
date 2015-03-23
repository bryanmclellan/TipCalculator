//
//  SettingsViewController.swift
//  tips
//
//  Created by Bryan McLellan on 3/21/15.
//  Copyright (c) 2015 Bryan McLellan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var DefaultTipPercentageField: UITextField!
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(red: 204/255.0, green: 255/229.0, blue: 255/255.0, alpha: 0.9)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func EditingDidEndSettings(sender: AnyObject) {
        var defaultTipPercentage = DefaultTipPercentageField.text.toInt()
        println(DefaultTipPercentageField.text)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipPercentage!, forKey: "SettingTipPercentage")
        defaults.setObject(DefaultTipPercentageField.text, forKey: "SettingString")
        defaults.synchronize()

        
        
        
    }

}
