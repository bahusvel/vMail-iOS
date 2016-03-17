//
//  ViewController.swift
//  vMail
//
//  Created by denis lavrov on 8/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, VMailBoxListener {
    
    @IBOutlet weak var tableView: UITableView!
    static var incomingMailBox = VMailBox()
    var client: VMailClient?
	static var instance: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
		ViewController.instance = self
        if VMailClient.anInstance == nil {
            client = VMailClient(inbox: ViewController.incomingMailBox, outbox: nil)
        } else {
            client = VMailClient.anInstance
        }
        if !(client!.authenticated) {
            authenticate()
        }
        ViewController.incomingMailBox.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        print("Connecting...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newMessage(message: VMail) {
        tableView.reloadData()
    }
    
    func authenticate() -> Bool{
        client?.authenticate("bahus.vel@bahus.com", password: "password")
        return true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.incomingMailBox.getUnread().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! VMailCell
        cell.setVMail(ViewController.incomingMailBox.getUnread()[indexPath.row])
        return cell
    }
	
}

