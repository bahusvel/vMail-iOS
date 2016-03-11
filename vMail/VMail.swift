//
//  VMail.swift
//  vMail
//
//  Created by denis lavrov on 11/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import Foundation

class VMail{
    let sender: String
    let receivers: [String]
    var hiddenReceivers: [String] = []
    let subject: String
    var transcript: String? = nil
    var audio: NSData? = nil
    var attachments: [NSData] = []
    
    
    init(sender: String, receivers: [String], subject: String){
        self.sender = sender
        self.receivers = receivers
        self.subject = subject
    }
    
    convenience init(vmessage: VmailProto.Vmessage){
        self.init(sender: vmessage.sender, receivers: vmessage.receivers, subject: vmessage.subject)
    }
    
    
    func toVMessage() -> VmailProto.Vmessage?{
        let vb = VmailProto.Vmessage.Builder()
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