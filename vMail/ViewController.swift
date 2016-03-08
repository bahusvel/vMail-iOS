//
//  ViewController.swift
//  vMail
//
//  Created by denis lavrov on 8/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segueToCompose(sender: CircleButton) {
        performSegueWithIdentifier("compose", sender: sender)
    }

}

