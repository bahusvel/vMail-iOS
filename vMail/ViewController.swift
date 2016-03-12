//
//  ViewController.swift
//  vMail
//
//  Created by denis lavrov on 8/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static let client = VMailClient()
	static var instance: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
		ViewController.instance = self
        // Do any additional setup after loading the view, typically from a nib.
        print("Connecting...")
        ViewController.client.authenticate("bahus.vel@gmail.com", password: "password")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	/*
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.destinationViewController is ComposeViewController && sender is CircleButton{
			print("Setting the circle button")
		}
	}
	*/
	
}

