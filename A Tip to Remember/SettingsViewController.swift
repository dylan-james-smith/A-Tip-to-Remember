//
//  SettingsViewController.swift
//  A Tip to Remember
//
//  Created by Dylan Smith on 12/10/15.
//  Copyright © 2015 dylan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstKeyboardField: UITextField!
    @IBOutlet weak var lowTipField: UITextField!
    @IBOutlet weak var goodTipField: UITextField!
    @IBOutlet weak var greatTipField: UITextField!
    @IBOutlet weak var lowTipStepper: UIStepper!
    @IBOutlet weak var goodTipStepper: UIStepper!
    @IBOutlet weak var greatTipStepper: UIStepper!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup percentage views and stepper
        lowTipField.text = defaults.stringForKey("lowTipKey")
        goodTipField.text = defaults.stringForKey("goodTipKey")
        greatTipField.text = defaults.stringForKey("greatTipKey")
        lowTipField.placeholder = defaults.stringForKey("lowTipKey")
        goodTipField.placeholder = defaults.stringForKey("goodTipKey")
        greatTipField.placeholder = defaults.stringForKey("greatTipKey")
        lowTipStepper.value = defaults.doubleForKey("lowTipKey")
        goodTipStepper.value = defaults.doubleForKey("goodTipKey")
        greatTipStepper.value = defaults.doubleForKey("greatTipKey")
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //keep decimal pad on screen
        firstKeyboardField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lowStepperAction(sender: AnyObject) {
        defaults.setObject(lowTipStepper.value, forKey: "lowTipKey")
        lowTipField.placeholder = defaults.stringForKey("lowTipKey")
        lowTipField.text = defaults.stringForKey("lowTipKey")
        
    }
    @IBAction func onLowTipChanged(sender: AnyObject) {
        defaults.setObject(NSString(string: lowTipField.text!).doubleValue, forKey: "lowTipKey")
        lowTipField.placeholder = defaults.stringForKey("lowTipKey")
        lowTipStepper.value = defaults.doubleForKey("lowTipKey")
    }
    
    @IBAction func goodStepperAction(sender: AnyObject) {
        defaults.setObject(goodTipStepper.value, forKey: "goodTipKey")
        goodTipField.placeholder = defaults.stringForKey("goodTipKey")
        goodTipField.text = defaults.stringForKey("goodTipKey")
        
    }
    @IBAction func onGoodTipChanged(sender: AnyObject) {
        defaults.setObject(NSString(string: goodTipField.text!).doubleValue, forKey: "goodTipKey")
        goodTipField.placeholder = defaults.stringForKey("goodTipKey")
        goodTipStepper.value = defaults.doubleForKey("goodTipKey")
        
    }
    
    @IBAction func greatStepperAction(sender: AnyObject) {
        defaults.setObject(greatTipStepper.value, forKey: "greatTipKey")
        greatTipField.placeholder = defaults.stringForKey("greatTipKey")
        greatTipField.text = defaults.stringForKey("greatTipKey")
        
    }
    @IBAction func onGreatTipChanged(sender: AnyObject) {
        defaults.setObject(NSString(string: greatTipField.text!).doubleValue, forKey: "greatTipKey")
        greatTipField.placeholder = defaults.stringForKey("greatTipKey")
        greatTipStepper.value = defaults.doubleForKey("greatTipKey")
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        // to keep things looking good
        //"click out" of text fields
        view.endEditing(true)
        firstKeyboardField.becomeFirstResponder()
        // and "bolding" placeholders back to text if no change
        lowTipField.text = defaults.stringForKey("lowTipKey")
        goodTipField.text = defaults.stringForKey("goodTipKey")
        greatTipField.text = defaults.stringForKey("greatTipKey")
    }

}
