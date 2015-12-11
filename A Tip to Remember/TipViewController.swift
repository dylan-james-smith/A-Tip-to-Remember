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
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    func tipPercent(tips: String){
        
    }
    
    func updateTipTotal(){
        let billAmount = NSString(string: billField.text!).doubleValue
        let tipPercentages = [defaults.doubleForKey("lowTipKey")/100, defaults.doubleForKey("goodTipKey")/100, defaults.doubleForKey("greatTipKey")/100]
        let tipControlSelected = tipControl.selectedSegmentIndex
        let tipPercentage = tipPercentages[tipControlSelected]
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        updateTipTotal()
        
    }

}
