//
//  vMailClient.swift
//  vMail
//
//  Created by denis lavrov on 10/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import Foundation

class VMailClient: NSObject, NSStreamDelegate{
    var inputStream: NSInputStream?
    var outputStream: NSOutputStream?
    
    func authenticate(username: String, password: String){
        let message = ["type": "auth_request", "username":username, "password":password]
        let packed = packItems([message], withOptions: [.PackWithUTF8StringEncoding])
        outputStream?.write(UnsafePointer<UInt8>(packed.bytes), maxLength: packed.length)
    }
    
    func messageIn(msg: [String: AnyObject]){
        
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
            let unpackedItems = try msgData.unpack()
            print(unpackedItems[0].castToDictionary!)
            } catch let error as NSError{
                print(error)
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
    }
}