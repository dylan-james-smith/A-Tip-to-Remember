//
//  SettingsViewController.swift
//  A Tip to Remember
//
//  Created by Dylan Smith on 12/10/15.
//  Copyright © 2015 dylan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var frKeyboardField: UITextField!
    @IBOutlet weak var lowTipField: UITextField!
    @IBOutlet weak var goodTipField: UITextField!
    @IBOutlet weak var greatTipField: UITextField!
    @IBOutlet weak var lowTipStepper: UIStepper!
    @IBOutlet weak var goodTipStepper: UIStepper!
    @IBOutlet weak var greatTipStepper: UIStepper!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //keep decimal pad on screen
        frKeyboardField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
