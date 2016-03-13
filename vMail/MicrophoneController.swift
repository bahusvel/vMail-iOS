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
    var audioPlayer: AVAudioPlayer? = nil
    let recordSettings:[String: AnyObject] = [AVFormatIDKey:Int(kAudioFormatAppleIMA4),
        AVSampleRateKey:44100.0,
        AVNumberOfChannelsKey:1,AVEncoderBitRateKey:12800,
        AVLinearPCMBitDepthKey:16,
        AVEncoderAudioQualityKey:AVAudioQuality.Max.rawValue]
    let documents: AnyObject = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,  NSSearchPathDomainMask.UserDomainMask, true)[0]
    var recordURL: NSURL?
    
	init(){
		let audioSession = AVAudioSession.sharedInstance()
		if (audioSession.respondsToSelector("requestRecordPermission:")) {
			audioSession.requestRecordPermission({(granted: Bool) -> Void in
				do{
                    try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                    try audioSession.setActive(true)
                    print("Microphone setup successful")
				} catch {
					print("Failed setting up the recording")
				}})
		}
	}
	
    func record(name: String){
        let str =  documents.stringByAppendingPathComponent(name + ".caf")
        recordURL = NSURL.fileURLWithPath(str)
        do {
            self.audioRecorder = try AVAudioRecorder(URL: recordURL!, settings: recordSettings)
        } catch {
            print("Failed setting up the recording")
        }
		if let ar = audioRecorder{
			print("Recording")
			ar.record()
		}
	}
	
	func stop() -> NSURL? {
		if let ar = audioRecorder{
			print("Stopped")
			ar.stop()
            return recordURL
		}
        return nil
	}
    
    func play(url: NSURL){
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOfURL: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Audio player could not init")
        }
    }
    
    func stopPlaying(){
        if let ap = audioPlayer{
            ap.stop()
        }
    }
}