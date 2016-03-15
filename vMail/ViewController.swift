//
//  ViewController.swift
//  vMail
//
//  Created by denis lavrov on 8/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var client: VMailClient?
	static var instance: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
		ViewController.instance = self
        if VMailClient.anInstance == nil {
            client = VMailClient()
        } else {
            client = VMailClient.anInstance
        }
        if !(client!.authenticated) {
            authenticate()
        }
        // Do any additional setup after loading the view, typically from a nib.
        print("Connecting...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authenticate() -> Bool{
        client?.authenticate("bahus.vel@bahus.com", password: "password")
        return true
    }
    
	/*
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.destinationViewController is ComposeViewController && sender is CircleButton{
			print("Setting the circle button")
		}
	}
	*/
	
}

