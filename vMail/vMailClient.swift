//
//  vMailClient.swift
//  vMail
//
//  Created by denis lavrov on 10/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import Foundation
import ProtocolBuffers

class VMailClient: NSObject, NSStreamDelegate{
    static var anInstance: VMailClient?
    var inputStream: NSInputStream?
    var outputStream: NSOutputStream?
    var authenticated = false
    
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
        default:
            print("Unknown message type")
        }
        vmailMessageBuilder.messageData = message.data()
        do {
        let messageData = try vmailMessageBuilder.build().data()
        outputStream?.write(UnsafePointer<UInt8>(messageData.bytes), maxLength: messageData.length)
        } catch {
            print("Erorr serializing the message")
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
                let vmessage = try Vproto.Vmessage.parseFromData(message.data())
                vmessageIn(vmessage)
            default:
                print("Unknown Message Type")
            }
        } catch {
            print("Deserialization error")
        }
    }
    
    func authIn(message: Vproto.AuthResponse){
        authenticated = message.success
        let vmail = VMail(sender: "bahus.vel@bahus.com", receivers: ["bahus.vel@bahus.com"], subject: "Testing vMail")
        sendVmessage(vmail)
    }
    
    func vmessageIn(message: Vproto.Vmessage){
        print(message)
    }
    
    func stream(aStream: NSStream, handleEvent eventCode: NSStreamEvent) {
        switch eventCode{
        case NSStreamEvent.OpenCompleted:
            print("Stream open")
        case NSStreamEvent.HasBytesAvailable:
            var buffer = [UInt8](count: 1024, repeatedValue: 0)
            var message = [UInt8]()
            if aStream == inputStream{
                while inputStream!.hasBytesAvailable{
                    let len = inputStream?.read(&buffer, maxLength: buffer.count)
                    if len > 0 {
                        message.appendContentsOf(buffer[0..<len!])
                    }
                }
            }
            print(message)
            let msgData = NSData(bytes: UnsafePointer<Void>(message), length: message.count)
            do {
                let vmailMessage = try Vproto.VmailMessage.parseFromData(msgData)
                messageIn(vmailMessage)
            } catch{
                print("Deserialization error")
            }
        case NSStreamEvent.EndEncountered:
            inputStream = nil
            outputStream = nil
        default:
            print(eventCode)
        }
    }
    
    override init(){
        super.init()
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