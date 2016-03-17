//
//  vMailClient.swift
//  vMail
//
//  Created by denis lavrov on 10/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import Foundation
import ProtocolBuffers

protocol VMailBoxListener{
    func newMessage(message: VMail)
}

class VMailBox{
    var messages: [VMail] = []
    var delegate: VMailBoxListener?
    
    func addMessage(message: Vproto.Vmessage){
        let message = VMail(vmessage: message)
        messages.append(message)
        delegate?.newMessage(message)
    }
    
    func getUnread() -> [VMail] {
        var unread = [VMail]()
        for message in messages {
            if message.status == .Unread {
                unread.append(message)
            }
        }
        return unread
    }
}

class VMailClient: NSObject, NSStreamDelegate{
    static var anInstance: VMailClient?
    var inputStream: NSInputStream?
    var outputStream: NSOutputStream?
    var authenticated = false
    var inbox: VMailBox?
    var outbox: VMailBox?
    
    func authenticate(username: String, password: String){
        let authRequestBuilder = Vproto.AuthRequest.Builder()
        authRequestBuilder.username = username
        authRequestBuilder.password = password
        do {
        let authRequest = try authRequestBuilder.build()
        sendMessage(authRequest)
        } catch {
            print("Serialization Error")
        }
        
    }
    
    func sendMessage(message: AbstractMessage){
        let vmailMessageBuilder = Vproto.VmailMessage.Builder()
        switch message {
        case is Vproto.AuthRequest:
            vmailMessageBuilder.mtype = Vproto.MessageType.AuthRequest
        case is Vproto.Vmessage:
            vmailMessageBuilder.mtype = Vproto.MessageType.Vmessage
            print(message.data())
        default:
            print("Unknown message type")
        }
        vmailMessageBuilder.messageData = message.data()
        do {
        let messageData = try vmailMessageBuilder.build().data()
        outputStream?.write(typetobinary(UInt32(messageData.length)), maxLength: 4)
        outputStream?.write(UnsafePointer<UInt8>(messageData.bytes), maxLength: messageData.length)
        } catch {
            print("Erorr serializing the message")
        }
    }
    
    func typetobinary <T> (var value: T) -> [UInt8]
    {
        return withUnsafePointer(&value)
            {
                Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>($0), count: sizeof(T)))
        }
    }
    
    func sendVmessage(message: VMail) -> Bool{
        if let vmessage = message.toVMessage() {
            if authenticated {
                sendMessage(vmessage)
                return true
            }
        }
        return false
    }
    
    func messageIn(message: Vproto.VmailMessage){
        do {
            switch message.mtype{
            case Vproto.MessageType.AuthResponse:
                let auth_response = try Vproto.AuthResponse.parseFromData(message.data())
                authIn(auth_response)
            case Vproto.MessageType.Vmessage:
                print(message.data())
                let vmessage = try Vproto.Vmessage.parseFromData(message.data())
                vmessageIn(vmessage)
            default:
                print("Unknown Message Type")
            }
        } catch {
            print("Deserialization error \(error)")
        }
    }
    
    func authIn(message: Vproto.AuthResponse){
        print("Authentication success")
        authenticated = message.success
        let vmail = VMail(sender: "bahus.vel@bahus.com", receivers: ["bahus.vel@bahus.com"], subject: "Testing vMail")
        sendVmessage(vmail)
    }
    
    func vmessageIn(message: Vproto.Vmessage){
        print(message.receivers)
        inbox?.addMessage(message)
    }
    
    func stream(aStream: NSStream, handleEvent eventCode: NSStreamEvent) {
        switch eventCode{
        case NSStreamEvent.OpenCompleted:
            break
        case NSStreamEvent.HasBytesAvailable:
            var lenbuffer = [UInt8](count: 4, repeatedValue: 0)
            var buffer = [UInt8](count: 1024, repeatedValue: 0)
            var message = [UInt8]()
            if aStream == inputStream {
                inputStream?.read(&lenbuffer, maxLength: 4)
                let totalLength:UInt32 = UnsafePointer<UInt32>(lenbuffer).memory
                while UInt32(message.count) < totalLength{
                    let len = inputStream?.read(&buffer, maxLength: min(buffer.count, Int(totalLength - UInt32(message.count))))
                    if len > 0 {
                        message.appendContentsOf(buffer[0..<len!])
                    }
                }
            }
            let msgData = NSData(bytes: UnsafePointer<Void>(message), length: message.count)
            do {
                let vmailMessage = try Vproto.VmailMessage.parseFromData(msgData)
                messageIn(vmailMessage)
            } catch{
                print("Deserialization error")
            }
        case NSStreamEvent.EndEncountered, NSStreamEvent.ErrorOccurred:
            print("Connection closed")
            inputStream?.close()
            outputStream?.close()
        default:
            if eventCode != .HasSpaceAvailable {
                print(eventCode)
            }
        }
    }
    
    init(inbox: VMailBox, outbox: VMailBox?){
        super.init()
        self.inbox = inbox
        self.outbox = outbox
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        CFStreamCreatePairWithSocketToHost(nil, "localhost", 9989, &readStream, &writeStream)
        inputStream = readStream!.takeRetainedValue() as NSInputStream
        outputStream = writeStream!.takeRetainedValue() as NSOutputStream
        
        inputStream!.delegate = self
        outputStream!.delegate = self
        
        inputStream?.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        outputStream?.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        inputStream?.open()
        outputStream?.open()
        print("Client init complete")
        VMailClient.anInstance = self
    }
}