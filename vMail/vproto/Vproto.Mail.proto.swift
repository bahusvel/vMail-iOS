// Generated by the protocol buffer compiler.  DO NOT EDIT!
// Source file mail.proto

import Foundation
import ProtocolBuffers


public extension Vproto{}

public func == (lhs: Vproto.Vmessage, rhs: Vproto.Vmessage) -> Bool {
  if (lhs === rhs) {
    return true
  }
  var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
  fieldCheck = fieldCheck && (lhs.hasSender == rhs.hasSender) && (!lhs.hasSender || lhs.sender == rhs.sender)
  fieldCheck = fieldCheck && (lhs.receivers == rhs.receivers)
  fieldCheck = fieldCheck && (lhs.hiddenReceivers == rhs.hiddenReceivers)
  fieldCheck = fieldCheck && (lhs.hasSubject == rhs.hasSubject) && (!lhs.hasSubject || lhs.subject == rhs.subject)
  fieldCheck = fieldCheck && (lhs.hasTranscript == rhs.hasTranscript) && (!lhs.hasTranscript || lhs.transcript == rhs.transcript)
  fieldCheck = fieldCheck && (lhs.hasAudio == rhs.hasAudio) && (!lhs.hasAudio || lhs.audio == rhs.audio)
  fieldCheck = fieldCheck && (lhs.attachments == rhs.attachments)
  fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
  return fieldCheck
}

public extension Vproto {
  public struct MailRoot {
    public static var sharedInstance : MailRoot {
     struct Static {
         static let instance : MailRoot = MailRoot()
     }
     return Static.instance
    }
    public var extensionRegistry:ExtensionRegistry

    init() {
      extensionRegistry = ExtensionRegistry()
      registerAllExtensions(extensionRegistry)
    }
    public func registerAllExtensions(registry:ExtensionRegistry) {
    }
  }

  final public class Vmessage : GeneratedMessage, GeneratedMessageProtocol {
    public private(set) var sender:String = ""

    public private(set) var hasSender:Bool = false
    public private(set) var receivers:Array<String> = Array<String>()
    public private(set) var hiddenReceivers:Array<String> = Array<String>()
    public private(set) var subject:String = ""

    public private(set) var hasSubject:Bool = false
    public private(set) var transcript:String = ""

    public private(set) var hasTranscript:Bool = false
    public private(set) var audio:NSData = NSData()

    public private(set) var hasAudio:Bool = false
    public private(set) var attachments:Array<NSData> = Array<NSData>()
    required public init() {
         super.init()
    }
    override public func isInitialized() -> Bool {
      if !hasSender {
        return false
      }
      if !hasSubject {
        return false
      }
     return true
    }
    override public func writeToCodedOutputStream(output:CodedOutputStream) throws {
      if hasSender {
        try output.writeString(1, value:sender)
      }
      if !receivers.isEmpty {
        for oneValuereceivers in receivers {
          try output.writeString(2, value:oneValuereceivers)
        }
      }
      if !hiddenReceivers.isEmpty {
        for oneValuehiddenReceivers in hiddenReceivers {
          try output.writeString(3, value:oneValuehiddenReceivers)
        }
      }
      if hasSubject {
        try output.writeString(4, value:subject)
      }
      if hasTranscript {
        try output.writeString(5, value:transcript)
      }
      if hasAudio {
        try output.writeData(6, value:audio)
      }
      if !attachments.isEmpty {
        for oneValueattachments in attachments {
          try output.writeData(7, value:oneValueattachments)
        }
      }
      try unknownFields.writeToCodedOutputStream(output)
    }
    override public func serializedSize() -> Int32 {
      var serialize_size:Int32 = memoizedSerializedSize
      if serialize_size != -1 {
       return serialize_size
      }

      serialize_size = 0
      if hasSender {
        serialize_size += sender.computeStringSize(1)
      }
      var dataSizeReceivers:Int32 = 0
      for oneValuereceivers in receivers {
          dataSizeReceivers += oneValuereceivers.computeStringSizeNoTag()
      }
      serialize_size += dataSizeReceivers
      serialize_size += 1 * Int32(receivers.count)
      var dataSizeHiddenReceivers:Int32 = 0
      for oneValuehiddenReceivers in hiddenReceivers {
          dataSizeHiddenReceivers += oneValuehiddenReceivers.computeStringSizeNoTag()
      }
      serialize_size += dataSizeHiddenReceivers
      serialize_size += 1 * Int32(hiddenReceivers.count)
      if hasSubject {
        serialize_size += subject.computeStringSize(4)
      }
      if hasTranscript {
        serialize_size += transcript.computeStringSize(5)
      }
      if hasAudio {
        serialize_size += audio.computeDataSize(6)
      }
      var dataSizeAttachments:Int32 = 0
      for oneValueattachments in attachments {
          dataSizeAttachments += oneValueattachments.computeDataSizeNoTag()
      }
      serialize_size += dataSizeAttachments
      serialize_size += 1 * Int32(attachments.count)
      serialize_size += unknownFields.serializedSize()
      memoizedSerializedSize = serialize_size
      return serialize_size
    }
    public class func parseArrayDelimitedFromInputStream(input:NSInputStream) throws -> Array<Vproto.Vmessage> {
      var mergedArray = Array<Vproto.Vmessage>()
      while let value = try parseFromDelimitedFromInputStream(input) {
        mergedArray += [value]
      }
      return mergedArray
    }
    public class func parseFromDelimitedFromInputStream(input:NSInputStream) throws -> Vproto.Vmessage? {
      return try Vproto.Vmessage.Builder().mergeDelimitedFromInputStream(input)?.build()
    }
    public class func parseFromData(data:NSData) throws -> Vproto.Vmessage {
      return try Vproto.Vmessage.Builder().mergeFromData(data, extensionRegistry:Vproto.MailRoot.sharedInstance.extensionRegistry).build()
    }
    public class func parseFromData(data:NSData, extensionRegistry:ExtensionRegistry) throws -> Vproto.Vmessage {
      return try Vproto.Vmessage.Builder().mergeFromData(data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFromInputStream(input:NSInputStream) throws -> Vproto.Vmessage {
      return try Vproto.Vmessage.Builder().mergeFromInputStream(input).build()
    }
    public class func parseFromInputStream(input:NSInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.Vmessage {
      return try Vproto.Vmessage.Builder().mergeFromInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFromCodedInputStream(input:CodedInputStream) throws -> Vproto.Vmessage {
      return try Vproto.Vmessage.Builder().mergeFromCodedInputStream(input).build()
    }
    public class func parseFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.Vmessage {
      return try Vproto.Vmessage.Builder().mergeFromCodedInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    public class func getBuilder() -> Vproto.Vmessage.Builder {
      return Vproto.Vmessage.classBuilder() as! Vproto.Vmessage.Builder
    }
    public func getBuilder() -> Vproto.Vmessage.Builder {
      return classBuilder() as! Vproto.Vmessage.Builder
    }
    public override class func classBuilder() -> MessageBuilder {
      return Vproto.Vmessage.Builder()
    }
    public override func classBuilder() -> MessageBuilder {
      return Vproto.Vmessage.Builder()
    }
    public func toBuilder() throws -> Vproto.Vmessage.Builder {
      return try Vproto.Vmessage.builderWithPrototype(self)
    }
    public class func builderWithPrototype(prototype:Vproto.Vmessage) throws -> Vproto.Vmessage.Builder {
      return try Vproto.Vmessage.Builder().mergeFrom(prototype)
    }
    override public func getDescription(indent:String) throws -> String {
      var output:String = ""
      if hasSender {
        output += "\(indent) sender: \(sender) \n"
      }
      var receiversElementIndex:Int = 0
      for oneValuereceivers in receivers  {
          output += "\(indent) receivers[\(receiversElementIndex)]: \(oneValuereceivers)\n"
          receiversElementIndex++
      }
      var hiddenReceiversElementIndex:Int = 0
      for oneValuehiddenReceivers in hiddenReceivers  {
          output += "\(indent) hiddenReceivers[\(hiddenReceiversElementIndex)]: \(oneValuehiddenReceivers)\n"
          hiddenReceiversElementIndex++
      }
      if hasSubject {
        output += "\(indent) subject: \(subject) \n"
      }
      if hasTranscript {
        output += "\(indent) transcript: \(transcript) \n"
      }
      if hasAudio {
        output += "\(indent) audio: \(audio) \n"
      }
      var attachmentsElementIndex:Int = 0
      for oneValueattachments in attachments  {
          output += "\(indent) attachments[\(attachmentsElementIndex)]: \(oneValueattachments)\n"
          attachmentsElementIndex++
      }
      output += unknownFields.getDescription(indent)
      return output
    }
    override public var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasSender {
               hashCode = (hashCode &* 31) &+ sender.hashValue
            }
            for oneValuereceivers in receivers {
                hashCode = (hashCode &* 31) &+ oneValuereceivers.hashValue
            }
            for oneValuehiddenReceivers in hiddenReceivers {
                hashCode = (hashCode &* 31) &+ oneValuehiddenReceivers.hashValue
            }
            if hasSubject {
               hashCode = (hashCode &* 31) &+ subject.hashValue
            }
            if hasTranscript {
               hashCode = (hashCode &* 31) &+ transcript.hashValue
            }
            if hasAudio {
               hashCode = (hashCode &* 31) &+ audio.hashValue
            }
            for oneValueattachments in attachments {
                hashCode = (hashCode &* 31) &+ oneValueattachments.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    override public class func className() -> String {
        return "Vproto.Vmessage"
    }
    override public func className() -> String {
        return "Vproto.Vmessage"
    }
    override public func classMetaType() -> GeneratedMessage.Type {
        return Vproto.Vmessage.self
    }
    //Meta information declaration end

    final public class Builder : GeneratedMessageBuilder {
      private var builderResult:Vproto.Vmessage = Vproto.Vmessage()
      public func getMessage() -> Vproto.Vmessage {
          return builderResult
      }

      required override public init () {
         super.init()
      }
      public var hasSender:Bool {
           get {
                return builderResult.hasSender
           }
      }
      public var sender:String {
           get {
                return builderResult.sender
           }
           set (value) {
               builderResult.hasSender = true
               builderResult.sender = value
           }
      }
      public func setSender(value:String) -> Vproto.Vmessage.Builder {
        self.sender = value
        return self
      }
      public func clearSender() -> Vproto.Vmessage.Builder{
           builderResult.hasSender = false
           builderResult.sender = ""
           return self
      }
      public var receivers:Array<String> {
           get {
               return builderResult.receivers
           }
           set (array) {
               builderResult.receivers = array
           }
      }
      public func setReceivers(value:Array<String>) -> Vproto.Vmessage.Builder {
        self.receivers = value
        return self
      }
      public func clearReceivers() -> Vproto.Vmessage.Builder {
         builderResult.receivers.removeAll(keepCapacity: false)
         return self
      }
      public var hiddenReceivers:Array<String> {
           get {
               return builderResult.hiddenReceivers
           }
           set (array) {
               builderResult.hiddenReceivers = array
           }
      }
      public func setHiddenReceivers(value:Array<String>) -> Vproto.Vmessage.Builder {
        self.hiddenReceivers = value
        return self
      }
      public func clearHiddenReceivers() -> Vproto.Vmessage.Builder {
         builderResult.hiddenReceivers.removeAll(keepCapacity: false)
         return self
      }
      public var hasSubject:Bool {
           get {
                return builderResult.hasSubject
           }
      }
      public var subject:String {
           get {
                return builderResult.subject
           }
           set (value) {
               builderResult.hasSubject = true
               builderResult.subject = value
           }
      }
      public func setSubject(value:String) -> Vproto.Vmessage.Builder {
        self.subject = value
        return self
      }
      public func clearSubject() -> Vproto.Vmessage.Builder{
           builderResult.hasSubject = false
           builderResult.subject = ""
           return self
      }
      public var hasTranscript:Bool {
           get {
                return builderResult.hasTranscript
           }
      }
      public var transcript:String {
           get {
                return builderResult.transcript
           }
           set (value) {
               builderResult.hasTranscript = true
               builderResult.transcript = value
           }
      }
      public func setTranscript(value:String) -> Vproto.Vmessage.Builder {
        self.transcript = value
        return self
      }
      public func clearTranscript() -> Vproto.Vmessage.Builder{
           builderResult.hasTranscript = false
           builderResult.transcript = ""
           return self
      }
      public var hasAudio:Bool {
           get {
                return builderResult.hasAudio
           }
      }
      public var audio:NSData {
           get {
                return builderResult.audio
           }
           set (value) {
               builderResult.hasAudio = true
               builderResult.audio = value
           }
      }
      public func setAudio(value:NSData) -> Vproto.Vmessage.Builder {
        self.audio = value
        return self
      }
      public func clearAudio() -> Vproto.Vmessage.Builder{
           builderResult.hasAudio = false
           builderResult.audio = NSData()
           return self
      }
      public var attachments:Array<NSData> {
           get {
               return builderResult.attachments
           }
           set (array) {
               builderResult.attachments = array
           }
      }
      public func setAttachments(value:Array<NSData>) -> Vproto.Vmessage.Builder {
        self.attachments = value
        return self
      }
      public func clearAttachments() -> Vproto.Vmessage.Builder {
         builderResult.attachments.removeAll(keepCapacity: false)
         return self
      }
      override public var internalGetResult:GeneratedMessage {
           get {
              return builderResult
           }
      }
      public override func clear() -> Vproto.Vmessage.Builder {
        builderResult = Vproto.Vmessage()
        return self
      }
      public override func clone() throws -> Vproto.Vmessage.Builder {
        return try Vproto.Vmessage.builderWithPrototype(builderResult)
      }
      public override func build() throws -> Vproto.Vmessage {
           try checkInitialized()
           return buildPartial()
      }
      public func buildPartial() -> Vproto.Vmessage {
        let returnMe:Vproto.Vmessage = builderResult
        return returnMe
      }
      public func mergeFrom(other:Vproto.Vmessage) throws -> Vproto.Vmessage.Builder {
        if other == Vproto.Vmessage() {
         return self
        }
        if other.hasSender {
             sender = other.sender
        }
        if !other.receivers.isEmpty {
            builderResult.receivers += other.receivers
        }
        if !other.hiddenReceivers.isEmpty {
            builderResult.hiddenReceivers += other.hiddenReceivers
        }
        if other.hasSubject {
             subject = other.subject
        }
        if other.hasTranscript {
             transcript = other.transcript
        }
        if other.hasAudio {
             audio = other.audio
        }
        if !other.attachments.isEmpty {
            builderResult.attachments += other.attachments
        }
        try mergeUnknownFields(other.unknownFields)
        return self
      }
      public override func mergeFromCodedInputStream(input:CodedInputStream) throws -> Vproto.Vmessage.Builder {
           return try mergeFromCodedInputStream(input, extensionRegistry:ExtensionRegistry())
      }
      public override func mergeFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.Vmessage.Builder {
        let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(self.unknownFields)
        while (true) {
          let protobufTag = try input.readTag()
          switch protobufTag {
          case 0: 
            self.unknownFields = try unknownFieldsBuilder.build()
            return self

          case 10 :
            sender = try input.readString()

          case 18 :
            receivers += [try input.readString()]

          case 26 :
            hiddenReceivers += [try input.readString()]

          case 34 :
            subject = try input.readString()

          case 42 :
            transcript = try input.readString()

          case 50 :
            audio = try input.readData()

          case 58 :
            attachments += [try input.readData()]

          default:
            if (!(try parseUnknownField(input,unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:protobufTag))) {
               unknownFields = try unknownFieldsBuilder.build()
               return self
            }
          }
        }
      }
    }

  }

}

// @@protoc_insertion_point(global_scope)