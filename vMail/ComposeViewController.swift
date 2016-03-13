//
//  ComposeViewController.swift
//  vMail
//
//  Created by denis lavrov on 12/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
   
    var voiceMessageData: NSData? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	@IBAction func cancel(sender: UIBarButtonItem) {
        MasterController.anInstance?.transitionTo(0){_,_ in}
	}
    
    @IBAction func sendVMail(sender: AnyObject) {
        print("Sending")
        MasterController.anInstance?.transitionTo(0){_,_ in}
    }

}
