//
//  VMail.swift
//  vMail
//
//  Created by denis lavrov on 11/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import Foundation

enum Status {
    case Read
    case Unread
    case Flagged
}

class VMail{
    // vmail standard
    let sender: String
    let receivers: [String]
    var hiddenReceivers: [String] = []
    let subject: String
    var transcript: String? = nil
    var audio: NSData? = nil
    var attachments: [NSData] = []
    // client standard
    var status = Status.Unread
    
    
    init(sender: String, receivers: [String], subject: String){
        self.sender = sender
        self.receivers = receivers
        self.subject = subject
    }
    
    convenience init(vmessage: Vproto.Vmessage){
        self.init(sender: vmessage.sender, receivers: vmessage.receivers, subject: vmessage.subject)
    }
    
    
    func toVMessage() -> Vproto.Vmessage?{
        let vb = Vproto.Vmessage.Builder()
        vb.sender = sender
        vb.subject = subject
        vb.receivers = receivers
        do {
           return try vb.build()
        } catch{
            return nil
        }
    }
}