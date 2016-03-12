//
//  MicBarViewController.swift
//  vMail
//
//  Created by denis lavrov on 12/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class MicBarViewController: UIViewController {
	static let micController = MicrophoneController()
	static var isCompose = false
	static var instance: MicBarViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
		print("Mic Loaded")
		MicBarViewController.instance = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	@IBAction func segueToCompose(sender: CircleButton) {
		MicBarViewController.micController.record()
		MasterController.anInstance?.selectedIndex = 1
	}
	
	
	@IBAction func microphoneUp(sender: CircleButton) {
		MicBarViewController.micController.stop()
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
