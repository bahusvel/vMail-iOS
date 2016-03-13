//
//  MasterController.swift
//  vMail
//
//  Created by denis lavrov on 12/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class MasterController: UITabBarController {
	static var anInstance: MasterController?

    override func viewDidLoad() {
        super.viewDidLoad()
		MasterController.anInstance = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transitionTo(index: Int, callback: (UIViewController?, UIViewController?) -> Void){
        let from = selectedViewController
        selectedIndex = index
        let to = selectedViewController
        callback(from, to)
    }
}
