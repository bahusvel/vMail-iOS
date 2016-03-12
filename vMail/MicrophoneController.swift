//
//  MicrophoneController.swift
//  vMail
//
//  Created by denis lavrov on 12/03/16.
//  Copyright © 2016 Denis Lavrov. All rights reserved.
//

import Foundation
import AVFoundation

class MicrophoneController{
	var audioRecorder: AVAudioRecorder? = nil
	
	init(){
		let audioSession = AVAudioSession.sharedInstance()
		if (audioSession.respondsToSelector("requestRecordPermission:")) {
			audioSession.requestRecordPermission({(granted: Bool) -> Void in
				do{
				try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
				try audioSession.setActive(true)
				let documents: AnyObject = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory,  NSSearchPathDomainMask.UserDomainMask, true)[0]
				let str =  documents.stringByAppendingPathComponent("recordTest.caf")
				let url = NSURL.fileURLWithPath(str)
				let recordSettings:[String: AnyObject] = [AVFormatIDKey:Int(kAudioFormatAppleIMA4),
					AVSampleRateKey:44100.0,
					AVNumberOfChannelsKey:2,AVEncoderBitRateKey:12800,
					AVLinearPCMBitDepthKey:16,
					AVEncoderAudioQualityKey:AVAudioQuality.Max.rawValue]
				self.audioRecorder = try AVAudioRecorder(URL: url, settings: recordSettings)
				print("Microphone setup successful")
				} catch {
					print("Failed setting up the recording")
				}})
		}
	}
	
	func record(){
		if let ar = audioRecorder{
			print("Recording")
			ar.record()
		}
	}
	
	func stop(){
		if let ar = audioRecorder{
			print("Stopped")
			ar.stop()
		}
	}
}