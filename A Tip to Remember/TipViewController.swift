//
//  TipViewController.swift
//  A Tip to Remember
//
//  Created by Dylan Smith on 12/10/15.
//  Copyright © 2015 dylan. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let now = NSDate()
        let then = defaults.objectForKey("lastTimeKey") as? NSDate
        print(now.timeIntervalSinceDate(then!))
        
        if  (now.timeIntervalSinceDate(then!) < 600){
            billField.text = NSUserDefaults.standardUserDefaults().stringForKey("lastBillKey")
            print("load last bill amount")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        //set tipControl segment titles from defaults when page appears.
        tipControl.setTitle(defaults.stringForKey("lowTipKey")!+"%", forSegmentAtIndex: 0)
        tipControl.setTitle(defaults.stringForKey("goodTipKey")!+"%", forSegmentAtIndex: 1)
        tipControl.setTitle(defaults.stringForKey("greatTipKey")!+"%", forSegmentAtIndex: 2)
        updateTipTotal()
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //keep decimal pad on screen
        billField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTipTotal(){
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        
        //setup bill amount & time elapsed defaults value
        let billAmount = NSString(string: billField.text!).doubleValue
        defaults.setDouble(billAmount, forKey: "lastBillKey")
        defaults.setObject(NSDate(), forKey: "lastTimeKey")
        
        let tipPercentages = [defaults.doubleForKey("lowTipKey")/100, defaults.doubleForKey("goodTipKey")/100, defaults.doubleForKey("greatTipKey")/100]
        let tipControlSelected = tipControl.selectedSegmentIndex
        let tipPercentage = tipPercentages[tipControlSelected]
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        currencyLabel.text = currencyFormatter.currencySymbol
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)!
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        updateTipTotal()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        defaults.synchronize()
    }
    override func viewDidDisappear(animated: Bool) {
        print("view did disapear")
    }

    
}
