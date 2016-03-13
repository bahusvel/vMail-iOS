// Generated by the protocol buffer compiler.  DO NOT EDIT!
// Source file vmail.proto

import Foundation
import ProtocolBuffers


public extension Vproto{}

public func == (lhs: Vproto.VmailMessage, rhs: Vproto.VmailMessage) -> Bool {
  if (lhs === rhs) {
    return true
  }
  var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
  fieldCheck = fieldCheck && (lhs.hasMtype == rhs.hasMtype) && (!lhs.hasMtype || lhs.mtype == rhs.mtype)
  fieldCheck = fieldCheck && (lhs.hasMessageData == rhs.hasMessageData) && (!lhs.hasMessageData || lhs.messageData == rhs.messageData)
  fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
  return fieldCheck
}

public func == (lhs: Vproto.Error, rhs: Vproto.Error) -> Bool {
  if (lhs === rhs) {
    return true
  }
  var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
  fieldCheck = fieldCheck && (lhs.hasText == rhs.hasText) && (!lhs.hasText || lhs.text == rhs.text)
  fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
  return fieldCheck
}

public extension Vproto {
  public struct VmailRoot {
    public static var sharedInstance : VmailRoot {
     struct Static {
         static let instance : VmailRoot = VmailRoot()
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



  //Enum type declaration start 

  public enum MessageType:Int32, CustomDebugStringConvertible, CustomStringConvertible {
    case AuthRequest = 1
    case AuthResponse = 2
    case Vmessage = 3

    public var debugDescription:String { return getDescription() }
    public var description:String { return getDescription() }
    private func getDescription() -> String { 
        switch self {
            case .AuthRequest: return ".AuthRequest"
            case .AuthResponse: return ".AuthResponse"
            case .Vmessage: return ".Vmessage"
        }
    }
  }

  //Enum type declaration end 

  final public class VmailMessage : GeneratedMessage, GeneratedMessageProtocol {
    public private(set) var mtype:Vproto.MessageType = Vproto.MessageType.AuthRequest
    public private(set) var hasMtype:Bool = false
    public private(set) var messageData:NSData = NSData()

    public private(set) var hasMessageData:Bool = false
    required public init() {
         super.init()
    }
    override public func isInitialized() -> Bool {
      if !hasMtype {
        return false
      }
      if !hasMessageData {
        return false
      }
     return true
    }
    override public func writeToCodedOutputStream(output:CodedOutputStream) throws {
      if hasMtype {
        try output.writeEnum(1, value:mtype.rawValue)
      }
      if hasMessageData {
        try output.writeData(2, value:messageData)
      }
      try unknownFields.writeToCodedOutputStream(output)
    }
    override public func serializedSize() -> Int32 {
      var serialize_size:Int32 = memoizedSerializedSize
      if serialize_size != -1 {
       return serialize_size
      }

      serialize_size = 0
      if (hasMtype) {
        serialize_size += mtype.rawValue.computeEnumSize(1)
      }
      if hasMessageData {
        serialize_size += messageData.computeDataSize(2)
      }
      serialize_size += unknownFields.serializedSize()
      memoizedSerializedSize = serialize_size
      return serialize_size
    }
    public class func parseArrayDelimitedFromInputStream(input:NSInputStream) throws -> Array<Vproto.VmailMessage> {
      var mergedArray = Array<Vproto.VmailMessage>()
      while let value = try parseFromDelimitedFromInputStream(input) {
        mergedArray += [value]
      }
      return mergedArray
    }
    public class func parseFromDelimitedFromInputStream(input:NSInputStream) throws -> Vproto.VmailMessage? {
      return try Vproto.VmailMessage.Builder().mergeDelimitedFromInputStream(input)?.build()
    }
    public class func parseFromData(data:NSData) throws -> Vproto.VmailMessage {
      return try Vproto.VmailMessage.Builder().mergeFromData(data, extensionRegistry:Vproto.VmailRoot.sharedInstance.extensionRegistry).build()
    }
    public class func parseFromData(data:NSData, extensionRegistry:ExtensionRegistry) throws -> Vproto.VmailMessage {
      return try Vproto.VmailMessage.Builder().mergeFromData(data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFromInputStream(input:NSInputStream) throws -> Vproto.VmailMessage {
      return try Vproto.VmailMessage.Builder().mergeFromInputStream(input).build()
    }
    public class func parseFromInputStream(input:NSInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.VmailMessage {
      return try Vproto.VmailMessage.Builder().mergeFromInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFromCodedInputStream(input:CodedInputStream) throws -> Vproto.VmailMessage {
      return try Vproto.VmailMessage.Builder().mergeFromCodedInputStream(input).build()
    }
    public class func parseFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.VmailMessage {
      return try Vproto.VmailMessage.Builder().mergeFromCodedInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    public class func getBuilder() -> Vproto.VmailMessage.Builder {
      return Vproto.VmailMessage.classBuilder() as! Vproto.VmailMessage.Builder
    }
    public func getBuilder() -> Vproto.VmailMessage.Builder {
      return classBuilder() as! Vproto.VmailMessage.Builder
    }
    public override class func classBuilder() -> MessageBuilder {
      return Vproto.VmailMessage.Builder()
    }
    public override func classBuilder() -> MessageBuilder {
      return Vproto.VmailMessage.Builder()
    }
    public func toBuilder() throws -> Vproto.VmailMessage.Builder {
      return try Vproto.VmailMessage.builderWithPrototype(self)
    }
    public class func builderWithPrototype(prototype:Vproto.VmailMessage) throws -> Vproto.VmailMessage.Builder {
      return try Vproto.VmailMessage.Builder().mergeFrom(prototype)
    }
    override public func getDescription(indent:String) throws -> String {
      var output:String = ""
      if (hasMtype) {
        output += "\(indent) mtype: \(mtype.description)\n"
      }
      if hasMessageData {
        output += "\(indent) messageData: \(messageData) \n"
      }
      output += unknownFields.getDescription(indent)
      return output
    }
    override public var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasMtype {
               hashCode = (hashCode &* 31) &+ Int(mtype.rawValue)
            }
            if hasMessageData {
               hashCode = (hashCode &* 31) &+ messageData.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    override public class func className() -> String {
        return "Vproto.VmailMessage"
    }
    override public func className() -> String {
        return "Vproto.VmailMessage"
    }
    override public func classMetaType() -> GeneratedMessage.Type {
        return Vproto.VmailMessage.self
    }
    //Meta information declaration end

    final public class Builder : GeneratedMessageBuilder {
      private var builderResult:Vproto.VmailMessage = Vproto.VmailMessage()
      public func getMessage() -> Vproto.VmailMessage {
          return builderResult
      }

      required override public init () {
         super.init()
      }
        public var hasMtype:Bool{
            get {
                return builderResult.hasMtype
            }
        }
        public var mtype:Vproto.MessageType {
            get {
                return builderResult.mtype
            }
            set (value) {
                builderResult.hasMtype = true
                builderResult.mtype = value
            }
        }
        public func setMtype(value:Vproto.MessageType) -> Vproto.VmailMessage.Builder {
          self.mtype = value
          return self
        }
        public func clearMtype() -> Vproto.VmailMessage.Builder {
           builderResult.hasMtype = false
           builderResult.mtype = .AuthRequest
           return self
        }
      public var hasMessageData:Bool {
           get {
                return builderResult.hasMessageData
           }
      }
      public var messageData:NSData {
           get {
                return builderResult.messageData
           }
           set (value) {
               builderResult.hasMessageData = true
               builderResult.messageData = value
           }
      }
      public func setMessageData(value:NSData) -> Vproto.VmailMessage.Builder {
        self.messageData = value
        return self
      }
      public func clearMessageData() -> Vproto.VmailMessage.Builder{
           builderResult.hasMessageData = false
           builderResult.messageData = NSData()
           return self
      }
      override public var internalGetResult:GeneratedMessage {
           get {
              return builderResult
           }
      }
      public override func clear() -> Vproto.VmailMessage.Builder {
        builderResult = Vproto.VmailMessage()
        return self
      }
      public override func clone() throws -> Vproto.VmailMessage.Builder {
        return try Vproto.VmailMessage.builderWithPrototype(builderResult)
      }
      public override func build() throws -> Vproto.VmailMessage {
           try checkInitialized()
           return buildPartial()
      }
      public func buildPartial() -> Vproto.VmailMessage {
        let returnMe:Vproto.VmailMessage = builderResult
        return returnMe
      }
      public func mergeFrom(other:Vproto.VmailMessage) throws -> Vproto.VmailMessage.Builder {
        if other == Vproto.VmailMessage() {
         return self
        }
        if other.hasMtype {
             mtype = other.mtype
        }
        if other.hasMessageData {
             messageData = other.messageData
        }
        try mergeUnknownFields(other.unknownFields)
        return self
      }
      public override func mergeFromCodedInputStream(input:CodedInputStream) throws -> Vproto.VmailMessage.Builder {
           return try mergeFromCodedInputStream(input, extensionRegistry:ExtensionRegistry())
      }
      public override func mergeFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.VmailMessage.Builder {
        let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(self.unknownFields)
        while (true) {
          let protobufTag = try input.readTag()
          switch protobufTag {
          case 0: 
            self.unknownFields = try unknownFieldsBuilder.build()
            return self

          case 8 :
            let valueIntmtype = try input.readEnum()
            if let enumsmtype = Vproto.MessageType(rawValue:valueIntmtype){
                 mtype = enumsmtype
            } else {
                 try unknownFieldsBuilder.mergeVarintField(1, value:Int64(valueIntmtype))
            }

          case 18 :
            messageData = try input.readData()

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

  final public class Error : GeneratedMessage, GeneratedMessageProtocol {
    public private(set) var text:String = ""

    public private(set) var hasText:Bool = false
    required public init() {
         super.init()
    }
    override public func isInitialized() -> Bool {
      if !hasText {
        return false
      }
     return true
    }
    override public func writeToCodedOutputStream(output:CodedOutputStream) throws {
      if hasText {
        try output.writeString(1, value:text)
      }
      try unknownFields.writeToCodedOutputStream(output)
    }
    override public func serializedSize() -> Int32 {
      var serialize_size:Int32 = memoizedSerializedSize
      if serialize_size != -1 {
       return serialize_size
      }

      serialize_size = 0
      if hasText {
        serialize_size += text.computeStringSize(1)
      }
      serialize_size += unknownFields.serializedSize()
      memoizedSerializedSize = serialize_size
      return serialize_size
    }
    public class func parseArrayDelimitedFromInputStream(input:NSInputStream) throws -> Array<Vproto.Error> {
      var mergedArray = Array<Vproto.Error>()
      while let value = try parseFromDelimitedFromInputStream(input) {
        mergedArray += [value]
      }
      return mergedArray
    }
    public class func parseFromDelimitedFromInputStream(input:NSInputStream) throws -> Vproto.Error? {
      return try Vproto.Error.Builder().mergeDelimitedFromInputStream(input)?.build()
    }
    public class func parseFromData(data:NSData) throws -> Vproto.Error {
      return try Vproto.Error.Builder().mergeFromData(data, extensionRegistry:Vproto.VmailRoot.sharedInstance.extensionRegistry).build()
    }
    public class func parseFromData(data:NSData, extensionRegistry:ExtensionRegistry) throws -> Vproto.Error {
      return try Vproto.Error.Builder().mergeFromData(data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFromInputStream(input:NSInputStream) throws -> Vproto.Error {
      return try Vproto.Error.Builder().mergeFromInputStream(input).build()
    }
    public class func parseFromInputStream(input:NSInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.Error {
      return try Vproto.Error.Builder().mergeFromInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFromCodedInputStream(input:CodedInputStream) throws -> Vproto.Error {
      return try Vproto.Error.Builder().mergeFromCodedInputStream(input).build()
    }
    public class func parseFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.Error {
      return try Vproto.Error.Builder().mergeFromCodedInputStream(input, extensionRegistry:extensionRegistry).build()
    }
    public class func getBuilder() -> Vproto.Error.Builder {
      return Vproto.Error.classBuilder() as! Vproto.Error.Builder
    }
    public func getBuilder() -> Vproto.Error.Builder {
      return classBuilder() as! Vproto.Error.Builder
    }
    public override class func classBuilder() -> MessageBuilder {
      return Vproto.Error.Builder()
    }
    public override func classBuilder() -> MessageBuilder {
      return Vproto.Error.Builder()
    }
    public func toBuilder() throws -> Vproto.Error.Builder {
      return try Vproto.Error.builderWithPrototype(self)
    }
    public class func builderWithPrototype(prototype:Vproto.Error) throws -> Vproto.Error.Builder {
      return try Vproto.Error.Builder().mergeFrom(prototype)
    }
    override public func getDescription(indent:String) throws -> String {
      var output:String = ""
      if hasText {
        output += "\(indent) text: \(text) \n"
      }
      output += unknownFields.getDescription(indent)
      return output
    }
    override public var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasText {
               hashCode = (hashCode &* 31) &+ text.hashValue
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    override public class func className() -> String {
        return "Vproto.Error"
    }
    override public func className() -> String {
        return "Vproto.Error"
    }
    override public func classMetaType() -> GeneratedMessage.Type {
        return Vproto.Error.self
    }
    //Meta information declaration end

    final public class Builder : GeneratedMessageBuilder {
      private var builderResult:Vproto.Error = Vproto.Error()
      public func getMessage() -> Vproto.Error {
          return builderResult
      }

      required override public init () {
         super.init()
      }
      public var hasText:Bool {
           get {
                return builderResult.hasText
           }
      }
      public var text:String {
           get {
                return builderResult.text
           }
           set (value) {
               builderResult.hasText = true
               builderResult.text = value
           }
      }
      public func setText(value:String) -> Vproto.Error.Builder {
        self.text = value
        return self
      }
      public func clearText() -> Vproto.Error.Builder{
           builderResult.hasText = false
           builderResult.text = ""
           return self
      }
      override public var internalGetResult:GeneratedMessage {
           get {
              return builderResult
           }
      }
      public override func clear() -> Vproto.Error.Builder {
        builderResult = Vproto.Error()
        return self
      }
      public override func clone() throws -> Vproto.Error.Builder {
        return try Vproto.Error.builderWithPrototype(builderResult)
      }
      public override func build() throws -> Vproto.Error {
           try checkInitialized()
           return buildPartial()
      }
      public func buildPartial() -> Vproto.Error {
        let returnMe:Vproto.Error = builderResult
        return returnMe
      }
      public func mergeFrom(other:Vproto.Error) throws -> Vproto.Error.Builder {
        if other == Vproto.Error() {
         return self
        }
        if other.hasText {
             text = other.text
        }
        try mergeUnknownFields(other.unknownFields)
        return self
      }
      public override func mergeFromCodedInputStream(input:CodedInputStream) throws -> Vproto.Error.Builder {
           return try mergeFromCodedInputStream(input, extensionRegistry:ExtensionRegistry())
      }
      public override func mergeFromCodedInputStream(input:CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Vproto.Error.Builder {
        let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(self.unknownFields)
        while (true) {
          let protobufTag = try input.readTag()
          switch protobufTag {
          case 0: 
            self.unknownFields = try unknownFieldsBuilder.build()
            return self

          case 10 :
            text = try input.readString()

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
